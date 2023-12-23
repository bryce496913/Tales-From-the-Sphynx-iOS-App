//
//  Page19View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page19View.swift
import SwiftUI

struct Page19View: View {
    @State private var showPage22View = false
    @State private var showPage18View = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Nineteen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("This room is clearly light, and you are able to have a good look around. The room is lacking anything but two upright sarcophagi. On the floor in front of each sarcophagus is a set of hieroglyphics. You think to yourself, “This is just like those dumb emoji puzzles on Facebook; I am sure I can figure out which is the correct way to go.\"")
                .padding()
                .foregroundColor(.black)

            HStack {
                VStack {
                    Image(uiImage: #imageLiteral(resourceName: "hieroglyphics_(Left).png"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)

                    Button(action: {
                        showPage18View = true
                    }) {
                        Text("Open the left sarcophagus")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 150, height: 100) // Set a fixed height
                            .background(Color(hex: "d6be9d"))
                            .cornerRadius(10)
                            .multilineTextAlignment(.center) // Center the text
                    }
                    .fullScreenCover(isPresented: $showPage18View) {
                        Page18View()
                    }
                }

                Spacer()

                VStack {
                    Image(uiImage: #imageLiteral(resourceName: "hieroglyphics_(Right).png"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)

                    Button(action: {
                        showPage22View = true
                    }) {
                        Text("Open the right sarcophagus")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 150, height: 100) // Set a fixed height
                            .background(Color(hex: "d6be9d"))
                            .cornerRadius(10)
                            .multilineTextAlignment(.center) // Center the text
                    }
                    .fullScreenCover(isPresented: $showPage22View) {
                        Page22View()
                    }
                }
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page19View_Previews: PreviewProvider {
    static var previews: some View {
        Page19View()
    }
}
