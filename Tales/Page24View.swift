//
//  Page24View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page24View.swift
import SwiftUI

struct Page24View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Four.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You make it to the ladder and start to climb, yet your success is blanked by you slipping on one of the ladder’s steps, resulting in you falling into the blackness.")
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

struct Page24View_Previews: PreviewProvider {
    static var previews: some View {
        Page24View()
    }
}
