//
//  ContentView.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationState = AppNavigationState()
    @State private var isSplashActive = true

    var body: some View {
        ZStack {
            StoryStyle.pageBackground.edgesIgnoringSafeArea(.all)

            if isSplashActive {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isSplashActive = false
                            }
                        }
                    }
            } else {
                MainMenu()
                    .environmentObject(navigationState)
            }
        }
        .fullScreenCover(item: $navigationState.adventureSession) { _ in
            Plot1View()
                .environmentObject(navigationState)
        }
    }
}

struct SplashScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Icon.png"))
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
                .padding()
            Spacer()
        }
        .background(StoryStyle.menuBackground.edgesIgnoringSafeArea(.all))
    }
}

struct MainMenu: View {
    @EnvironmentObject private var navigationState: AppNavigationState

    var body: some View {

        VStack {

            Image(uiImage:#imageLiteral(resourceName: "Title-Screen-Art.png"))
                .resizable()
                .scaledToFit()
                .padding()

            ChoiceButton("New Game", width: nil, height: nil, action: {
                navigationState.startNewAdventure()

            })

            Spacer()

        }
        .background(StoryStyle.menuBackground.edgesIgnoringSafeArea(.all))

    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
