//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import Foundation
import Resolver
import Base
import Combine

enum HomeViewState {
    case finishLoadInfo
    case isLoading
    case noHasData
    case loadingMore
    case none
}

enum FilterHomeType {
    case `default`
    case byValue
    case byType
    case all

    init?(type: PokemonType, searchValue: String) {
        switch true {
        case searchValue.isEmpty && type == .none:
            self = .default
        case searchValue.isEmpty && type != .none:
            self = .byType
        case searchValue.isNotEmpty && type == .none:
            self = .byValue
        default:
            self = .all
        }
    }
}

protocol HomeViewModelProtocol {
    func viewDidLoad()
}

enum HomeViewModelFullScreenType: Identifiable {
    var id: String { String(reflecting: self) }
    
    case filter
    case pokemonDetail(_: Pokemon)
}
final class HomeViewModel: ObservableObject {
    @Published var viewState: HomeViewState = .none
    @Published var searchValue: String = .empty
    @Published var pokemos: [Pokemon] = []
    @Published var currentPokemonTypes: [PokemonType] = []
    @Published var filterTypeSelected: PokemonType = .none
    @Published var fullScreenType: HomeViewModelFullScreenType?

    private var originalPokemos: [Pokemon] = []
    
    @Injected private var store: Store<HomeState, HomeAction>

    private var cancellables = Set<AnyCancellable>()
    private var page = 0

    deinit {
        cancellables.removeAll()
    }
}

extension HomeViewModel {
    func viewDidLoad() {
        suscribeStore()
        triggerLoadPokemons()
    }
    
    func showFullScreen(with type: HomeViewModelFullScreenType) {
        fullScreenType =  type
    }

    func dismissFullScreen() {
        fullScreenType = nil
    }
    
    func clearFilters() {
        filterTypeSelected = .none
    }
    
    func executeFilters(with filterSelected: PokemonType) {
        guard !originalPokemos.isEmpty else { return }
        let filterType = FilterHomeType(type: filterSelected, searchValue: searchValue)
        switch filterType {
        case .default, .none:
            pokemos = originalPokemos
            
        case .byType:
            pokemos = originalPokemos.filter { $0.types.contains(filterSelected) }

        case .byValue:
            pokemos = originalPokemos.filter { $0.name.lowercased().contains(searchValue.lowercased()) }

        case .all:
            pokemos = originalPokemos
                .filter { $0.types.contains(filterSelected) }
                .filter { $0.name.lowercased().contains(searchValue.lowercased()) }
        }
        viewState = pokemos.isEmpty ? .noHasData : .finishLoadInfo
    }
}

extension HomeViewModel {
    // MARK: - Suscribe
    func suscribeStore() {
        store.$state.sink { [weak self] state in
            guard let self = self else { return }
            
            if case  let .loaded(pokemos, types) = state {
                if pokemos.isEmpty {
                    self.viewState = .noHasData
                    return
                }
                self.currentPokemonTypes = Array(
                    Set(self.currentPokemonTypes + types)
                ).sorted(by: { $0.rawValue < $1.rawValue })
                self.originalPokemos += pokemos.sorted(by: { $0.id < $1.id })
                self.searchValue = self.searchValue
                self.viewState = .finishLoadInfo
                return
            }
            
            if case  let .withError(error) = state {
                self.viewState = .finishLoadInfo
                BaseLogger.error(error.localizedDescription)
                return
            }
        }.store(in: &cancellables)
        
        $searchValue.sink { [weak self] value in
            guard let self = self else { return }
            self.executeFilters(with: self.filterTypeSelected)
        }.store(in: &cancellables)
        
        $filterTypeSelected.sink { [weak self] type in
            guard let self = self else { return }
            self.executeFilters(with: type)
        }.store(in: &cancellables)
    }
    
    // MARK: - Triggers
    func triggerLoadPokemons(increment: Bool = false) {
        if case .noHasData = viewState {
            return
        }
        if increment {
            page += 1
            viewState = .loadingMore
        } else {
            viewState = .isLoading
        }
        store.dispatch(.load(page * 10, 10))
    }
}
