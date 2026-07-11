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
        StoryPageLayout(
            imageName: "Six.png",
            text: "You wander slowly down the right corridor. Suddenly, you stop and listen. Now in silence, you can hear a faint mumble. You look over to where you think the sound is coming from. You start to slowly head in the direction of the noise and find a door. Though the mumbling has got louder, you are unable to make out if it is human or not."
        ) {

            HStack {
                ChoiceButton("Enter the door", action: {
                    showPage7 = true

                })
                .storyFullScreenCover(isPresented: $showPage7) {
                    Page7View()
                }
                .padding()

                Spacer()

                ChoiceButton("Continue down the corridor", action: {
                    showPage8 = true

                })
                .storyFullScreenCover(isPresented: $showPage8) {
                    Page8View()
                }
                .padding()
            }
        }
    }
}

struct Page6View_Previews: PreviewProvider {
    static var previews: some View {
        Page6View()
    }
}
