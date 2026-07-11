import SwiftUI

struct AnimatedStoryImage: View {
    let imageName: String
    var motionStyle: StoryImageMotionStyle = .slowZoom
    var parallaxAmount: CGFloat = 8
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var animate = false

    var body: some View {
        Image(uiImage: UIImage(named: imageName) ?? UIImage(named: imageName.replacingOccurrences(of: ".png", with: "")) ?? UIImage())
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .offset(x: xOffset, y: yOffset)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
            .shadow(color: AppTheme.shadow, radius: 16, x: 0, y: 10)
            .accessibilityLabel(Text("Story illustration"))
            .animation(reduceMotion ? nil : .easeInOut(duration: animationDuration).repeatForever(autoreverses: true), value: animate)
            .onAppear { if !reduceMotion { animate = true } }
            .onDisappear { animate = false }
            .onChange(of: reduceMotion) { newValue in animate = !newValue }
    }

    private var animationDuration: Double { 12.5 }
    private var scale: CGFloat { guard !reduceMotion, animate, motionStyle != .none else { return 1 }; return motionStyle == .slowZoom ? 1.06 : 1.04 }
    private var xOffset: CGFloat {
        guard !reduceMotion else { return 0 }
        switch motionStyle {
        case .driftLeft: return animate ? -parallaxAmount : parallaxAmount / 2
        case .driftRight, .subtleParallax: return animate ? parallaxAmount : -parallaxAmount / 2
        case .slowZoom: return animate ? 4 : -4
        case .none: return 0
        }
    }
    private var yOffset: CGFloat {
        guard !reduceMotion else { return 0 }
        switch motionStyle {
        case .slowZoom: return animate ? -2 : 2
        case .subtleParallax: return animate ? -4 : 4
        default: return 0
        }
    }
}
