//
//  Page13View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page13View.swift
import SwiftUI

struct Page13View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Thirteen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you wander down the hallway, torches light alongside you. The hallway opens to a large room. As the torches continue to fill the room with light, you discover the room is full of gold, gems and priceless artifacts. You have found the treasure room.\nWith your pockets and arms full of treasure you make your way to a door labeled exit, valuing to return later for the rest. Once outside, you are able to spot the road and flag down a vehicle to take you to safety, as a very rich person.")
                .padding()
                .foregroundColor(.black)

            Button(action: {
                showContentView = true
            }) {
                Text("Congratulations")
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

struct Page13View_Previews: PreviewProvider {
    static var previews: some View {
        Page13View()
    }
}
