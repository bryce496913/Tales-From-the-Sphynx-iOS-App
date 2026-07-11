//
//  Page15View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page15View.swift
import SwiftUI

struct Page15View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Fifteen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("The floor starts to rumble and before you know it, the floor turned to a slide, you lose your footing and slide down into the darkness. As you slide, you look down to your feet and see the light getting closer. Just like that, you pop out the Sphynx’s backside, onto the sand. You stand up and notice a helicopter above. The search and rescue team had been looking for you since someone reported the vehicle crash. You will be saved.")
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

struct Page15View_Previews: PreviewProvider {
    static var previews: some View {
        Page15View()
    }
}
