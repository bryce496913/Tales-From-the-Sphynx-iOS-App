//
//  Page17View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page17View.swift
import SwiftUI

struct Page17View: View {
    @State private var showPage18View = false
    @State private var showPage10View = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Seventeen.png"))
                .resizable()
                .scaledToFit()
                .padding(8)
                .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                .shadow(color: AppTheme.shadow, radius: 14, x: 0, y: 8)
                .padding(.horizontal)

            Text("Once you have entered the room, you see a strong but thin beam of light coming from a crack in the ceiling, and reflecting off a silver plate that is attached upright on hinges in the centre of the room. It seems that the angle and rotation of the plate can be adjusted. Also, in the room there are two statues guarding two doors; one is the God Re and the other the God Thorth. Both statues have a square piece of coloured glass in their chests. Maybe we can reflect the beam of light into one of the statue’s chest?")
                .padding()
                .foregroundColor(StoryStyle.textColor)
                .font(.system(.body, design: .serif))
                .lineSpacing(6)

            HStack {
                ChoiceButton("Shine the light at Re", action: {
                    showPage18View = true

                })
                .storyFullScreenCover(isPresented: $showPage18View, style: .torchReveal) {
                    Page18View()
                }

                Spacer()

                ChoiceButton("Shine the light at Thorth", action: {
                    showPage10View = true

                })
                .storyFullScreenCover(isPresented: $showPage10View) {
                    Page10View()
                }
            }
            .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page17View_Previews: PreviewProvider {
    static var previews: some View {
        Page17View()
    }
}
