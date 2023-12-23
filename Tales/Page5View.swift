//
//  Page5View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page5View.swift
import SwiftUI

struct Page5View: View {
    @State private var showPage20 = false
    @State private var showPage19 = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Five.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You make the jump successfully and enter the door. Once inside, you can hear what seems like meowing. From the shadows, an Abyssinian cat emerges. This cat proceeds to walk up to you while continuing to meow. And with an inviting flick of its tail, the cat disappears through a large crack in the wall.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage20 = true
                }) {
                    Text("Follow the cat through the crack")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage20) {
                    Page20View()
                }
                .padding()

                Spacer()

                Button(action: {
                    showPage19 = true
                }) {
                    Text("Continue down the hallway")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage19) {
                    Page19View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page5View_Previews: PreviewProvider {
    static var previews: some View {
        Page5View()
    }
}
