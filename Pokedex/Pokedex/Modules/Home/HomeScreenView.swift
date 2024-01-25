//
//  HomeScreenView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import SwiftUI
import Base

struct HomeScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    @FocusState private var isSearchFocused:Bool
    @State private var pokeBallOpacity: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                SearchView(searchValue: $viewModel.searchValue) {
                    viewModel.changeFilterVisibility()
                }.focused($isSearchFocused)
                
                if viewModel.filterTypeSelected != .none {
                    HStack {
                        Button {
                            withAnimation {
                                viewModel.clearFilters()
                                isSearchFocused = false
                            }
                        } label: {
                            HStack {
                                PokemonTypeView(type: viewModel.filterTypeSelected)
                                Image(systemName: "x.circle.fill")
                                    .font(.custom(.regular, size: 20))
                                    .foregroundColor(Color.black.opacity(0.6))
                            }
                        }.foregroundStyle(.black)
                        
                        Spacer()
                    }.padding(.horizontal)
                }
                buildViewState(viewState: viewModel.viewState)
                Spacer()
            }
            
            VStack {
                Spacer()
                Image(with: PokeAsset.Pokedex.pokeball)
                    .keyframeAnimator(
                        initialValue: AnimationRotateProperties()
                    ) { content, value in
                        content.rotationEffect(value.angle)
                    } keyframes: { _ in
                        KeyframeTrack(\.angle) {
                            LinearKeyframe(.degrees(360), duration: 0.2)
                            LinearKeyframe(.degrees(360), duration: 0.2)
                            LinearKeyframe(.degrees(360), duration: 0.2)
                            LinearKeyframe(.degrees(360), duration: 0.2)
                        }
                    }
            }.opacity(pokeBallOpacity)
        }
        .fullScreenCover(isPresented: $viewModel.showFilter) {
            PokemonFilterScreenView(
                typeSelected: $viewModel.filterTypeSelected,
                types: viewModel.currentPokemonTypes
            ) {
                viewModel.changeFilterVisibility(false)
            }
        }
        .onReceive(viewModel.$viewState) { state in
            withAnimation {
                pokeBallOpacity = state == .loadingMore ? 1 : 0
            }
        }
        .onAppear {
            viewModel.viewDidLoad()
        }
    }
    
    func dissmissModal() {
        
    }
    
    @ViewBuilder
    func buildViewState(viewState: HomeViewState) -> some View {
        switch viewState {
        case .finishLoadInfo, .loadingMore:
            ScrollView {
                ForEach(viewModel.pokemos) { pokemon in
                    LazyVStack(spacing: .zero) {
                        PokemonView(pokemon: pokemon)
                            .onAppear {
                                if pokemon.id == viewModel.pokemos.count && viewModel.viewState != .isLoading {
                                    viewModel.triggerLoadPokemons(increment: true)
                                    BaseLogger.warning("Dispatch new loading")
                                }
                            }
                    }
                }
            }.scrollDismissesKeyboard(.immediately)
        case .noHasData:
            VStack {
                Image(with: PokeAsset.Pokedex.noData)
                Text("No data")
                    .font(.custom(.bold, size: 30))
                    .foregroundColor(.gray.opacity(0.6))
            }
        case .none, .isLoading:
            ProgressView()
        }
    }
}

struct AnimationRotateProperties {
    var angle: Angle = .init(degrees: .zero)
}

#Preview {
    HomeScreenView()
}
