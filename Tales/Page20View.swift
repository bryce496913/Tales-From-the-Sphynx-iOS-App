//
//  Page20View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page20View.swift
import SwiftUI

struct Page20View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You wiggle, crawl, and shimmy your way through the winding path. The cat pauses frequently to be sure that you are still following. After several claustrophobic minutes, you tumble onto a white polished tiled floor. You look up to notice you are on the floor of a gift shop. A lady with the cat in hand walks to you and says, “sorry, we are not open for another hour.” You think to yourself, how cheap it is to exit through the gift shop.")
                .padding()
                .foregroundColor(.black)

            Button(action: {
                showContentView = true
            }) {
                Text("Game Over")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(hex: "d6be9d"))
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showContentView) {
                ContentView()
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page20View_Previews: PreviewProvider {
    static var previews: some View {
        Page20View()
    }
}
