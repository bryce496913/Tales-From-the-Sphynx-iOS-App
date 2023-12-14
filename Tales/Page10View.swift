//
//  Page10View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page10View.swift
import SwiftUI

struct Page10View: View {
    @State private var showPage12 = false
    @State private var showPage11 = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Ten.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("After a few steps into the room, you hear a click under your foot. You take a step back, just in time as the floor tile that was under your foot, disintegrates away to reveal a pit of darkness. Do you try making a run for it to reach the ladder at the other end, or would it be better to take it slowly.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage12 = true
                    } else {
                        showPage11 = true
                    }
                }) {
                    Text("Make a run for it")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage12) {
                    Page12View()
                }
                .padding()

                Spacer()

                Button(action: {
                    showPage11 = true
                }) {
                    Text("Take it slowly")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage11) {
                    Page11View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page10View_Previews: PreviewProvider {
    static var previews: some View {
        Page10View()
    }
}
