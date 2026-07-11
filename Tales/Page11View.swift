//
//  Page11View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page11View.swift
import SwiftUI

struct Page11View: View {

    var body: some View {
        StoryPageLayout(
            imageName: "Eleven.png",
            text: "You try to move slowly, step by step, but as soon as you take your next step, the complete floor starts to crumble. As you fall through the darkness, you notice time is irrelevant with no reference. Slowly, the nothingness is ending and you’re opening your eyes. You survey your surroundings; you are not falling… A sudden pain brings you back to reality, and you notice you are still in the vehicle wreckage. You call for help, but to no answer. You think, was the Sphinx just all in your mind while you were unconscious from the crash? You look around, your movements increase your pain. You close your eyes and drift back to the nothingness. It is peaceful."
        ) {

            AdventureResetButtons()
                .padding()
        }
    }
}

struct Page11View_Previews: PreviewProvider {
    static var previews: some View {
        Page11View()
    }
}
