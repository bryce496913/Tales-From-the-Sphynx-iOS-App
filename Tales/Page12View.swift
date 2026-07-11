//
//  Page12View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page12View.swift
import SwiftUI

struct Page12View: View {
    @State private var showPage14View = false
    @State private var showPage13View = false

    var body: some View {
        StoryPageLayout(
            imageName: "Twelve.png",
            text: "Every room so far has felt ancient and so does this one, besides the large modern metal door, that looks like something out of a sci-fi movie. So out of place in here! The only other way to go is a bejewelled archway leading to a brightly light corridor."
        ) {

            HStack {
                ChoiceButton("Inspect the metal door", action: {
                    showPage14View = true

                })
                .storyFullScreenCover(isPresented: $showPage14View, style: .stoneDoor) {
                    Page14View()
                }
                .padding()

                ChoiceButton("Enter the bright corridor", action: {
                    showPage13View = true

                })
                .storyFullScreenCover(isPresented: $showPage13View, style: .torchReveal) {
                    Page13View()
                }
                .padding()
            }
        }
    }
}

struct Page12View_Previews: PreviewProvider {
    static var previews: some View {
        Page12View()
    }
}
