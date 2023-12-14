//
//  Page7View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page7View.swift
import SwiftUI

struct Page7View: View {
    @State private var showGameOver = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Seven.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("Even with your little internal voice protesting, you push the thick wooden door open. As the door slowly opens, the mumbles become clearer….\n\n“This room was discovered in the late 1980’s by archaeologists….”\n\nSeems you have stumbled across a tour group. They introduce themselves as The Tomb Raider Tours. You explain your situation, and they invite you to finish the tour with them, which after, they will bring you back to the city. All is good!")
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

struct Page7View_Previews: PreviewProvider {
    static var previews: some View {
        Page7View()
    }
}
