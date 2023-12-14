//
//  Page2View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page2View.swift
import SwiftUI

struct Page2View: View {
    @State private var showGameOver = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Two.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("After hours of wandering in the desert heat, completely disoriented and unaware of how to get back to the Sphynx, you try to push on. Day turns to night and the heat turns to cold, you collapse in the sand. And as quickly as the night came, darkness takes your soul. Now just another statistic of deaths in the desert.")
                .padding()
                .foregroundColor(.black)

            Button(action: {
                showGameOver = true
            }) {
                Text("Game Over")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(hex: "d6be9d"))
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showGameOver) {
                ContentView()
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View()
    }
}
