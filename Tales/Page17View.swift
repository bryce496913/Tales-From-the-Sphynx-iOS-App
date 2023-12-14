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
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage18View) {
                    Page18View()
                }

                Spacer()

                NavigationLink(
                    destination: Page10View(),
                    label: {
                        Text("Shine the light at Thorth")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(hex: "d6be9d"))
                            .cornerRadius(10)
                    }
                )
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
