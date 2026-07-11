//
//  Plot1View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page1View.swift
import SwiftUI

struct Page1View: View {
    @State private var showPage2 = false
    @State private var showPage3 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "One.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("As you stand at the feet of this enormous Sphynx, you notice that the main doorway is open. You think to yourself, head inside to find help or head back in the direction where the road could be.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Try to enter the sphynx", action: {
                    showPage3 = true

                })
                .storyFullScreenCover(isPresented: $showPage3) {
                    Page3View()
                }
                .padding()

                Spacer()

                ChoiceButton("Try to find the road", action: {
                    showPage2 = true

                })
                .storyFullScreenCover(isPresented: $showPage2) {
                    Page2View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
