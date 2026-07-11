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
        StoryPageLayout(
            imageName: "Eighteen.png",
            text: "This is the darkest room you have entered. There is only one torch in this room, just off to your right. The only thing this torch is illuminating is a ladder that leads to an opening in the ceiling. Taking this torch would make exploring the rest of the room easier."
        ) {

            HStack {
                ChoiceButton("Climb the ladder", action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage12View = true
                    } else {
                        showPage24View = true
                    }

                })
                .storyFullScreenCover(isPresented: $showPage12View) {
                    Page12View()
                }
                .storyFullScreenCover(isPresented: $showPage24View) {
                    Page24View()
                }

                Spacer()

                ChoiceButton("Take torch to explore", action: {
                    showPage15View = true

                })
                .storyFullScreenCover(isPresented: $showPage15View, style: .torchReveal) {
                    Page15View()
                }
            }
            .padding()
        }
    }
}

struct Page18View_Previews: PreviewProvider {
    static var previews: some View {
        Page18View()
    }
}
