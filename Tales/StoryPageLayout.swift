import SwiftUI

struct StoryPageLayout<Content: View>: View {
    let imageName: String
    let title: String?
    let text: String
    @ViewBuilder let choices: Content
    @State private var appeared = false

    init(imageName: String, title: String? = nil, text: String, @ViewBuilder choices: () -> Content) {
        self.imageName = imageName
        self.title = title
        self.text = text
        self.choices = choices()
    }

    var body: some View {
        ZStack {
            EgyptianBackground()
            VStack(spacing: 16) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        Image(uiImage: UIImage(named: imageName) ?? UIImage(named: imageName.replacingOccurrences(of: ".png", with: "")) ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
                            .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
                            .shadow(color: AppTheme.shadow, radius: 16, x: 0, y: 10)

                        VStack(alignment: .leading, spacing: 12) {
                            if let title {
                                Text(title)
                                    .font(.system(.title2, design: .serif).weight(.bold))
                                    .foregroundColor(AppTheme.gold)
                            }
                            Text(text)
                                .font(.system(.body, design: .serif))
                                .foregroundColor(AppTheme.warmText)
                                .lineSpacing(6)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .goldCard()
                    }
                    .padding(.horizontal, AppTheme.screenPadding)
                    .padding(.top, 18)
                    .padding(.bottom, 6)
                }
                VStack(spacing: 12) { choices }
                    .padding(.horizontal, AppTheme.screenPadding)
                    .padding(.bottom, 16)
            }
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 10)
        }
        .onAppear { withAnimation(.easeOut(duration: 0.45)) { appeared = true } }
    }
}
