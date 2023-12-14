//
//  Page6View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page6View.swift
import SwiftUI

struct Page6View: View {
    @State private var showPage7 = false
    @State private var showPage8 = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Six.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You wander slowly down the right corridor. Suddenly, you stop and listen. Now in silence, you can hear a faint mumble. You look over to where you think the sound is coming from. You start to slowly head in the direction of the noise and find a door. Though the mumbling has got louder, you are unable to make out if it is human or not.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage7 = true
                }) {
                    Text("Enter the door")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage7) {
                    Page7View()
                }
                .padding()

                Spacer()

                Button(action: {
                    showPage8 = true
                }) {
                    Text("Continue down the corridor")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showPage8) {
                    Page8View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page6View_Previews: PreviewProvider {
    static var previews: some View {
        Page6View()
    }
}
