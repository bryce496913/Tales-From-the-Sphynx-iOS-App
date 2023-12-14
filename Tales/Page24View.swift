//
//  Page24View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page24View.swift
import SwiftUI

struct Page24View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Four.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You make it to the ladder and start to climb, yet your success is blanked by you slipping on one of the ladder’s steps, resulting in you falling into the blackness.")
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

struct Page24View_Previews: PreviewProvider {
    static var previews: some View {
        Page24View()
    }
}
