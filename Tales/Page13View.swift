//
//  Page13View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page13View.swift
import SwiftUI

struct Page13View: View {

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Thirteen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("As you wander down the hallway, torches light alongside you. The hallway opens to a large room. As the torches continue to fill the room with light, you discover the room is full of gold, gems and priceless artifacts. You have found the treasure room.\nWith your pockets and arms full of treasure you make your way to a door labeled exit, valuing to return later for the rest. Once outside, you are able to spot the road and flag down a vehicle to take you to safety, as a very rich person.")
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

struct Page13View_Previews: PreviewProvider {
    static var previews: some View {
        Page13View()
    }
}
