//
//  Page19View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page19View.swift
import SwiftUI

struct Page19View: View {
    @State private var showPage22View = false
    @State private var showPage18View = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Nineteen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("This room is clearly light, and you are able to have a good look around. The room is lacking anything but two upright sarcophagi. On the floor in front of each sarcophagus is a set of hieroglyphics. You think to yourself, “This is just like those dumb emoji puzzles on Facebook; I am sure I can figure out which is the correct way to go.\"")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                VStack {
                    Image(uiImage: #imageLiteral(resourceName: "hieroglyphics_(Left).png"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)

                    ChoiceButton("Open the left sarcophagus", action: {
                        showPage18View = true

                })
                    .fullScreenCover(isPresented: $showPage18View) {
                        Page18View()
                    }
                }

                Spacer()

                VStack {
                    Image(uiImage: #imageLiteral(resourceName: "hieroglyphics_(Right).png"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)

                    ChoiceButton("Open the right sarcophagus", action: {
                        showPage22View = true

                })
                    .fullScreenCover(isPresented: $showPage22View) {
                        Page22View()
                    }
                }
            }
            .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page19View_Previews: PreviewProvider {
    static var previews: some View {
        Page19View()
    }
}
