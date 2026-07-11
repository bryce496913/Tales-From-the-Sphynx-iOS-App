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
        StoryPageLayout(
            imageName: "Eight.png",
            text: "As you walk down the corridor, things get darker and darker. You think to yourself “I don’t like all this darkness.” And just like that, with each footstep sound, you see a little light glow. You walk closer to one of these little lights and notice it is a scarab beetle, resting on the ground. “What is that?” you mumble to yourself; again, a path of small glowing beetles appears and continues into the distance. With these little extra lights, you also notice a door to your right."
        ) {

            HStack {
                ChoiceButton("Follow the beetle's light", action: {
                    showPage17 = true

                })
                .storyFullScreenCover(isPresented: $showPage17, style: .torchReveal) {
                    Page17View()
                }
                .padding()

                Spacer()

                ChoiceButton("Enter the door", action: {
                    showPage9 = true

                })
                .storyFullScreenCover(isPresented: $showPage9, style: .stoneDoor) {
                    Page9View()
                }
                .padding()
            }
        }
    }
}

struct Page8View_Previews: PreviewProvider {
    static var previews: some View {
        Page8View()
    }
}
