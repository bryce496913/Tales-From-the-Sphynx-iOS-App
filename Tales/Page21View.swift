//
//  Page21View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page21View.swift
import SwiftUI

struct Page21View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-One.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you pull the lever for Anubis, you suddenly hear howls of a jackal, and the statue of Anubis stands up. It is time for Anubis to take you. As the God of death, he will be sure to provide you the perfect burial. As Anubis takes you deep into the fallen sands, he too disappears into the sands, and you are left, forever trapped.")
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

struct Page21View_Previews: PreviewProvider {
    static var previews: some View {
        Page21View()
    }
}
