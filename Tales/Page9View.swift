//
//  Page9View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page9View.swift
import SwiftUI

struct Page9View: View {
    @State private var showPage21 = false
    @State private var showPage10 = false

    var body: some View {
        StoryPageLayout(
            imageName: "Nine.png",
            text: "On immediate inspection, this new room has nowhere obvious to go to next. Your worrying thought is interrupted by a thunderous sound, followed by rapidly rushing sand filling the room. You need to find a way out before you are buried alive. In the room are two statues, both with levers, one of God Anubis and the other of God Osiris. One of these statues could be the key out of here. If only you had reception, you could Google which each God represents."
        ) {

            HStack {
                ChoiceButton("Pick Anubis", action: {
                    showPage21 = true

                })
                .storyFullScreenCover(isPresented: $showPage21) {
                    Page21View()
                }
                .padding()

                Spacer()

                ChoiceButton("Pick Osiris", action: {
                    showPage10 = true

                })
                .storyFullScreenCover(isPresented: $showPage10) {
                    Page10View()
                }
                .padding()
            }
        }
    }
}

struct Page9View_Previews: PreviewProvider {
    static var previews: some View {
        Page9View()
    }
}
