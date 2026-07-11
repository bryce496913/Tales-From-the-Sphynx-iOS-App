//
//  Page3View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page3View.swift
import SwiftUI

struct Page3View: View {
    @State private var showPage4 = false
    @State private var showPage6 = false

    var body: some View {
        StoryPageLayout(
            imageName: "Three.png",
            text: "After climbing the stairs of the Sphynx, you enter the main hall. Though empty, the room is dimly lit, hinting at the chance of more people inside. As your eyes adjust to the change of light, you notice, at the back, the hall splits in two different directions."
        ) {

            HStack {
                ChoiceButton("Head down the left", action: {
                    showPage4 = true

                })
                .storyFullScreenCover(isPresented: $showPage4) {
                    Page4View()
                }
                .padding()

                Spacer()

                ChoiceButton("Head down the right", action: {
                    showPage6 = true

                })
                .storyFullScreenCover(isPresented: $showPage6) {
                    Page6View()
                }
                .padding()
            }
        }
    }
}

struct Page3View_Previews: PreviewProvider {
    static var previews: some View {
        Page3View()
    }
}
