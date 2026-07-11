//
//  Page7View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page7View.swift
import SwiftUI

struct Page7View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Seven.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("Even with your little internal voice protesting, you push the thick wooden door open. As the door slowly opens, the mumbles become clearer….\n\n“This room was discovered in the late 1980’s by archaeologists….”\n\nSeems you have stumbled across a tour group. They introduce themselves as The Tomb Raider Tours. You explain your situation, and they invite you to finish the tour with them, which after, they will bring you back to the city. All is good!")
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

struct Page7View_Previews: PreviewProvider {
    static var previews: some View {
        Page7View()
    }
}
