//
//  Page12View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page12View.swift
import SwiftUI

struct Page12View: View {
    @State private var showPage14View = false
    @State private var showPage13View = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twelve.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("Every room so far has felt ancient and so does this one, besides the large modern metal door, that looks like something out of a sci-fi movie. So out of place in here! The only other way to go is a bejewelled archway leading to a brightly light corridor.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Inspect the metal door", action: {
                    showPage14View = true

                })
                .storyFullScreenCover(isPresented: $showPage14View, style: .stoneDoor) {
                    Page14View()
                }
                .padding()

                ChoiceButton("Enter the bright corridor", action: {
                    showPage13View = true

                })
                .storyFullScreenCover(isPresented: $showPage13View, style: .torchReveal) {
                    Page13View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page12View_Previews: PreviewProvider {
    static var previews: some View {
        Page12View()
    }
}
