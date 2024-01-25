//
//  SplashScreenView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Image(with: PokeAsset.Common.pokemonLogo)
                    .resizable()
                    .frame(
                        width: reader.frame(in: .global).height / 2,
                        height: reader.frame(in: .global).width / 2
                    )
                    .keyframeAnimator(
                        initialValue: AnimationAchProperties()
                    ) { content, value in
                        content
                            .offset(value.translation)
                            .opacity(value.opacity)
                    } keyframes: { _ in
                        KeyframeTrack(\.translation) {
                            LinearKeyframe(CGSize(width: -200, height: 0), duration: 0.1)
                            LinearKeyframe(CGSize(width: -150, height: 0), duration: 0.2)
                            LinearKeyframe(CGSize(width: -100, height: 0), duration: 0.3)
                            LinearKeyframe(CGSize(width: -40, height: 0), duration: 0.4)
                            LinearKeyframe(CGSize(width: 40, height: 0), duration: 0.4)
                        }
                    }
                
                Image(with: PokeAsset.Common.ach)

                Image(with: PokeAsset.Common.pokedex)
                    .resizable()
                    .frame(
                        width: reader.frame(in: .global).height / 2,
                        height: reader.frame(in: .global).width / 2
                    )
                    .keyframeAnimator(
                        initialValue: AnimationProperties()
                    ) { content, value in
                        content
                            .scaleEffect(value.scale)
                            .scaleEffect(y: value.verticalStretch)
                            .offset(value.translation)
                            .opacity(value.opacity)
                    } keyframes: { _ in
                        
                        KeyframeTrack(\.translation) {
                            LinearKeyframe(CGSize(width: 0, height: 30), duration: 0.1)
                            LinearKeyframe(CGSize(width: 0, height: 90), duration: 0.2)
                            LinearKeyframe(CGSize(width: 0, height: 200), duration: 0.3)
                            LinearKeyframe(CGSize(width: 0, height: 400), duration: 0.4)
                        }
                        
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.1)
                            LinearKeyframe(0.8, duration: 0.2)
                            LinearKeyframe(0.6, duration: 0.3)
                        }
                        
                        KeyframeTrack(\.opacity) {
                            LinearKeyframe(1.0, duration: 0.1)
                            LinearKeyframe(0.7, duration: 0.2)
                        }
                    }.hidden()
            }
        }
        .onAppear {
            delay(deadline: 1.2) {
                coordinator.show(SplashCoordinator.home, animated: true)
            }
        }
    }
}

struct AnimationProperties {
    var scale = 1.0
    var verticalStretch = 1.0
    var translation = CGSize.zero
    var opacity = 1.0
}

struct AnimationAchProperties {
    var translation = CGSize(width: -200, height: 0)
    var opacity = 1.0
}

#Preview {
    SplashScreenView()
        .environmentObject(
            Coordinator(startingRoute: SplashCoordinator.splash)
        )
}
