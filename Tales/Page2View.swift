//
//  Page2View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page2View.swift
import SwiftUI

struct Page2View: View {

    var body: some View {
        StoryPageLayout(
            imageName: "Two.png",
            text: "After hours of wandering in the desert heat, completely disoriented and unaware of how to get back to the Sphinx, you try to push on. Day turns to night and the heat turns to cold, you collapse in the sand. And as quickly as the night came, darkness takes your soul. Now just another statistic of deaths in the desert."
        ) {

            AdventureResetButtons()
                .padding()
        }
    }
}

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View()
    }
}
