//
//  StoryStyle.swift
//  Tales
//
//  Shared lightweight styling for the V1 SwiftUI story screens.
//

import SwiftUI

enum StoryStyle {
    static let pageBackground = Color(hex: "00aeef")
    static let menuBackground = Color(hex: "81b9e4")
    static let choiceBackground = Color(hex: "d6be9d")
    static let textColor = Color.black
    static let choiceCornerRadius: CGFloat = 10
    static let choiceWidth: CGFloat = 150
    static let choiceHeight: CGFloat = 100
    static let pagePadding: CGFloat = 16
}

struct ChoiceButton: View {
    let title: String
    var width: CGFloat? = StoryStyle.choiceWidth
    var height: CGFloat? = StoryStyle.choiceHeight
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(StoryStyle.textColor)
                .padding()
                .frame(width: width, height: height)
                .background(StoryStyle.choiceBackground)
                .cornerRadius(StoryStyle.choiceCornerRadius)
                .multilineTextAlignment(.center)
        }
    }
}

