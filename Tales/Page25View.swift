//
//  Page25View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page25View.swift
import SwiftUI

struct Page25View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Five.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You almost make it to the door and turn to see where the spider is. You watch on in shock as the giant spider shoots its web at you, pinning you to the ground. With one of its many legs, the spider pushes the door closed.")
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

struct Page25View_Previews: PreviewProvider {
    static var previews: some View {
        Page25View()
    }
}
