//
//  Page12View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page12View.swift
import SwiftUI

struct Page12View: View {
    @State private var showPage14View = false
    @State private var showPage13View = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twelve.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("Every room so far has felt ancient and so does this one, besides the large modern metal door, that looks like something out of a sci-fi movie. So out of place in here! The only other way to go is a bejewelled archway leading to a brightly light corridor.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage14View = true
                }) {
                    Text("Inspect the metal door")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage14View) {
                    Page14View()
                }
                .padding()

                Button(action: {
                    showPage13View = true
                }) {
                    Text("Enter the bright corridor")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage13View) {
                    Page13View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page12View_Previews: PreviewProvider {
    static var previews: some View {
        Page12View()
    }
}
