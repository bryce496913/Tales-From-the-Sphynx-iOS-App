//
//  Page5View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page5View.swift
import SwiftUI

struct Page5View: View {
    @State private var showPage20 = false
    @State private var showPage19 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Five.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("You make the jump successfully and enter the door. Once inside, you can hear what seems like meowing. From the shadows, an Abyssinian cat emerges. This cat proceeds to walk up to you while continuing to meow. And with an inviting flick of its tail, the cat disappears through a large crack in the wall.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Follow the cat through the crack", action: {
                    showPage20 = true

                })
                .storyFullScreenCover(isPresented: $showPage20) {
                    Page20View()
                }
                .padding()

                Spacer()

                ChoiceButton("Continue down the hallway", action: {
                    showPage19 = true

                })
                .storyFullScreenCover(isPresented: $showPage19) {
                    Page19View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page5View_Previews: PreviewProvider {
    static var previews: some View {
        Page5View()
    }
}
