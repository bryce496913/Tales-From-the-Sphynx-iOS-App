//
//  Page22View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page22View.swift
import SwiftUI

struct Page22View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Two.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("As you slowly open up the right sarcophagus, you hear movement from within. You take a step back, and a body falls from the sarcophagus to the floor. The body wiggles and slowly stands up. You have awoken a mummy. Its glowing eyes stun each of you. As you stand paralyzed, cloth extends from the mummy’s arms and starts wrapping around you until you are engulfed completely. It is at this moment the mummy speaks, “Debbie, I got some new recruits.” A panel in the wall slides open and out comes another mummy with a clipboard. “Hi, I’m Debbie, and I will be your mummy trainer, here to get you all ready to scare any unsuspecting folk for all eternity.\"")
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

struct Page22View_Previews: PreviewProvider {
    static var previews: some View {
        Page22View()
    }
}
