//
//  Page14View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page14View.swift
import SwiftUI

struct Page14View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Fourteen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("As you approach the large metal door it slowly starts to open. This room is brightly light and the walls are covered in computer monitors. Your images are all over the monitors showing all the steps you did to get here. They have been studying and tracking you. Was this all some sort of test? As you ponder what just happened, two humanoid figures materialize in the room with you. They are holding some sort of weapons. You hear a voice over a speaker “test 12 complete, clear to neutralize the test subject” The last thing you see is a sudden bright light.")
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

struct Page14View_Previews: PreviewProvider {
    static var previews: some View {
        Page14View()
    }
}
