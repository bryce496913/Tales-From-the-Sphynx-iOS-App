//
//  Page17View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page17View.swift
import SwiftUI

struct Page17View: View {
    @State private var showPage18View = false
    @State private var showPage10View = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Seventeen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("Once you have entered the room, you see a strong but thin beam of light coming from a crack in the ceiling, and reflecting off a silver plate that is attached upright on hinges in the centre of the room. It seems that the angle and rotation of the plate can be adjusted. Also, in the room there are two statues guarding two doors; one is the God Re and the other the God Thorth. Both statues have a square piece of coloured glass in their chests. Maybe we can reflect the beam of light into one of the statue’s chest?")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage18View = true
                }) {
                    Text("Shine the light at Re")
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

                Spacer()

                Button(action: {
                    showPage10View = true
                }) {
                    Text("Shine the light at Thorth")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage10View) {
                    Page10View()
                }
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page17View_Previews: PreviewProvider {
    static var previews: some View {
        Page17View()
    }
}
