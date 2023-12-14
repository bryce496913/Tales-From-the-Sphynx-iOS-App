//
//  Page8View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page8View.swift
import SwiftUI

struct Page8View: View {
    @State private var showPage17 = false
    @State private var showPage9 = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Eight.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you walk down the corridor, things get darker and darker. You think to yourself “I don’t like all this darkness.” And just like that, with each footstep sound, you see a little light glow. You walk closer to one of these little lights and notice it is a scarab beetle, resting on the ground. “What is that?” you mumble to yourself; again, a path of small glowing beetles appears and continues into the distance. With these little extra lights, you also notice a door to your right.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage17 = true
                }) {
                    Text("Follow the zigzagging beetle path of light")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage17) {
                    Page17View()
                }
                .padding()

                Spacer()

                Button(action: {
                    showPage9 = true
                }) {
                    Text("Enter the door")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage9) {
                    Page9View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page8View_Previews: PreviewProvider {
    static var previews: some View {
        Page8View()
    }
}
