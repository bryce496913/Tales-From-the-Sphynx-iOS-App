//
//  Page16View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page16View.swift
import SwiftUI

struct Page16View: View {
    @State private var showPage19View = false
    @State private var showPage25View = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Sixteen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("The door is slightly stuck but you push harder and it slowly opens enough for you to slip through. The floor is sticky and your face brushes by, what felt like a cobweb. You hear scratching and shuffling. Your gaze is brought to the centre of the room when a deep voice whispers “hello there”. It is at that moment; you realise you are now face to face with a giant talking spider guarding a door.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage19View = true
                    } else {
                        showPage25View = true
                    }
                }) {
                    Text("Run between its legs to reach the door")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage19View) {
                    Page19View()
                }
                .fullScreenCover(isPresented: $showPage25View) {
                    Page25View()
                }

                Spacer()

                NavigationLink(
                    destination: Page17View(),
                    label: {
                        Text("Talk to the spider and ask nicely to let you in the door")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 150, height: 100) // Set a fixed height
                            .background(Color(hex: "d6be9d"))
                            .cornerRadius(10)
                            .multilineTextAlignment(.center) // Center the text
                    }
                )
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page16View_Previews: PreviewProvider {
    static var previews: some View {
        Page16View()
    }
}
