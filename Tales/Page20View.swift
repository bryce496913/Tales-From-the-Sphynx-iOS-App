//
//  Page20View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page20View.swift
import SwiftUI

struct Page20View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("You wiggle, crawl, and shimmy your way through the winding path. The cat pauses frequently to be sure that you are still following. After several claustrophobic minutes, you tumble onto a white polished tiled floor. You look up to notice you are on the floor of a gift shop. A lady with the cat in hand walks to you and says, “sorry, we are not open for another hour.” You think to yourself, how cheap it is to exit through the gift shop.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            AdventureResetButtons()
                .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page20View_Previews: PreviewProvider {
    static var previews: some View {
        Page20View()
    }
}
