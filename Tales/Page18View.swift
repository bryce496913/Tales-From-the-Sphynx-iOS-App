//
//  Page18View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page18View.swift
import SwiftUI

struct Page18View: View {
    @State private var showPage12View = false
    @State private var showPage24View = false
    @State private var showPage15View = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Eighteen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("This is the darkest room you have entered. There is only one torch in this room, just off to your right. The only thing this torch is illuminating is a ladder that leads to an opening in the ceiling. Taking this torch would make exploring the rest of the room easier.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage12View = true
                    } else {
                        showPage24View = true
                    }
                }) {
                    Text("Climb the ladder")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage12View) {
                    Page12View()
                }
                .fullScreenCover(isPresented: $showPage24View) {
                    Page24View()
                }

                Spacer()

                Button(action: {
                    showPage15View = true
                }) {
                    Text("Take torch to explore")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage15View) {
                    Page15View()
                }
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page18View_Previews: PreviewProvider {
    static var previews: some View {
        Page18View()
    }
}
