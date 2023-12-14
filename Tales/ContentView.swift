//
//  ContentView.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashActive = true

    var body: some View {
        ZStack {
            Color(hex: "00aeef").edgesIgnoringSafeArea(.all)

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
            }
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
        .background(Color(hex: "81b9e4").edgesIgnoringSafeArea(.all))
    }
}

struct MainMenu: View {

    @State private var showGame = false

    var body: some View {

        VStack {
            
            Image(uiImage:#imageLiteral(resourceName: "Title-Screen-Art.png"))
                .resizable()
                .scaledToFit()
                .padding()
            
            Button(action: {
                self.showGame = true
            }) {
                Text("New Game")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(hex: "d6be9d"))
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .fullScreenCover(isPresented: $showGame) {
            Plot1View()
        }
        .background(Color(hex:"81b9e4").edgesIgnoringSafeArea(.all))

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
