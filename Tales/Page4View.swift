//
//  Page4View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page4View.swift
import SwiftUI

struct Page4View: View {
    @State private var showPage16 = false
    @State private var showPage5 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Four.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You wander slowly down the left corridor and find yourself in a small room. In the center of the room, there is a pit that stretches from side to side and seems to be about 1.5 meters in length. On the other side of the pit is a door. Unenthusiastic about wanting to jump over the pit, you look around and notice a door just to your left.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            HStack {
                ChoiceButton("Enter the door on the left", action: {
                    showPage16 = true

                })
                .fullScreenCover(isPresented: $showPage16) {
                    Page16View()
                }
                .padding()

                Spacer()

                ChoiceButton("Jump the pit", action: {
                    showPage5 = true

                })
                .fullScreenCover(isPresented: $showPage5) {
                    Page5View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page4View_Previews: PreviewProvider {
    static var previews: some View {
        Page4View()
    }
}
