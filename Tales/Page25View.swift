//
//  Page25View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page25View.swift
import SwiftUI

struct Page25View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Five.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You almost make it to the door and turn to see where the spider is. You watch on in shock as the giant spider shoots its web at you, pinning you to the ground. With one of its many legs, the spider pushes the door closed.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            AdventureResetButtons()
                .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page25View_Previews: PreviewProvider {
    static var previews: some View {
        Page25View()
    }
}
