//
//  Page16View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page16View.swift
import SwiftUI

struct Page16View: View {
    @State private var showPage19View = false
    @State private var showPage25View = false
    @State private var showPage17View = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Sixteen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("The door is slightly stuck but you push harder and it slowly opens enough for you to slip through. The floor is sticky and your face brushes by, what felt like a cobweb. You hear scratching and shuffling. Your gaze is brought to the centre of the room when a deep voice whispers “hello there”. It is at that moment; you realise you are now face to face with a giant talking spider guarding a door.")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Run between its legs to reach the door", action: {
                    let randomNumber = Int.random(in: 1...2)
                    if randomNumber == 1 {
                        showPage19View = true
                    } else {
                        showPage25View = true
                    }

                })
                .storyFullScreenCover(isPresented: $showPage19View) {
                    Page19View()
                }
                .storyFullScreenCover(isPresented: $showPage25View) {
                    Page25View()
                }

                Spacer()

                ChoiceButton("Talk to the spider and ask nicely to let you in the door", action: {
                    showPage17View = true
                })
                .storyFullScreenCover(isPresented: $showPage17View) {
                    Page17View()
                }
            }
            .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page16View_Previews: PreviewProvider {
    static var previews: some View {
        Page16View()
    }
}
