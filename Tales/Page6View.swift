//
//  Page6View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page6View.swift
import SwiftUI

struct Page6View: View {
    @State private var showPage7 = false
    @State private var showPage8 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Six.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("You wander slowly down the right corridor. Suddenly, you stop and listen. Now in silence, you can hear a faint mumble. You look over to where you think the sound is coming from. You start to slowly head in the direction of the noise and find a door. Though the mumbling has got louder, you are unable to make out if it is human or not.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Enter the door", action: {
                    showPage7 = true

                })
                .fullScreenCover(isPresented: $showPage7) {
                    Page7View()
                }
                .padding()

                Spacer()

                ChoiceButton("Continue down the corridor", action: {
                    showPage8 = true

                })
                .fullScreenCover(isPresented: $showPage8) {
                    Page8View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page6View_Previews: PreviewProvider {
    static var previews: some View {
        Page6View()
    }
}
