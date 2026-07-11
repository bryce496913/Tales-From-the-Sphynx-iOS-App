//
//  Page21View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page21View.swift
import SwiftUI

struct Page21View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-One.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("As you pull the lever for Anubis, you suddenly hear howls of a jackal, and the statue of Anubis stands up. It is time for Anubis to take you. As the God of death, he will be sure to provide you the perfect burial. As Anubis takes you deep into the fallen sands, he too disappears into the sands, and you are left, forever trapped.")
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

struct Page21View_Previews: PreviewProvider {
    static var previews: some View {
        Page21View()
    }
}
