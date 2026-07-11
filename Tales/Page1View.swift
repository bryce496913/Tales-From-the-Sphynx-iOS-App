//
//  Plot1View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page1View.swift
import SwiftUI

struct Page1View: View {
    @State private var showPage2 = false
    @State private var showPage3 = false

    var body: some View {
        StoryPageLayout(
            imageName: "One.png",
            text: "As you stand at the feet of this enormous Sphynx, you notice that the main doorway is open. You think to yourself, head inside to find help or head back in the direction where the road could be."
        ) {

            HStack {
                ChoiceButton("Try to enter the sphynx", action: {
                    showPage3 = true

                })
                .storyFullScreenCover(isPresented: $showPage3) {
                    Page3View()
                }
                .padding()

                Spacer()

                ChoiceButton("Try to find the road", action: {
                    showPage2 = true

                })
                .storyFullScreenCover(isPresented: $showPage2) {
                    Page2View()
                }
                .padding()
            }
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
