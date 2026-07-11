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
        StoryPageLayout(
            imageName: "Ten.png",
            text: "After a few steps into the room, you hear a click under your foot. You take a step back, just in time as the floor tile that was under your foot, disintegrates away to reveal a pit of darkness. Do you try making a run for it to reach the ladder at the other end, or would it be better to take it slowly."
        ) {

            HStack {
                ChoiceButton("Make a run for it", action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage12 = true
                    } else {
                        showPage11 = true
                    }

                })
                .storyFullScreenCover(isPresented: $showPage12) {
                    Page12View()
                }
                .padding()

                Spacer()

                ChoiceButton("Take it slowly", action: {
                    showPage11 = true

                })
                .storyFullScreenCover(isPresented: $showPage11) {
                    Page11View()
                }
                .padding()
            }
        }
    }
}

struct Page10View_Previews: PreviewProvider {
    static var previews: some View {
        Page10View()
    }
}
