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
            .animation(reduceMotion ? nil : .easeInOut(duration: 11).repeatForever(autoreverses: true), value: animate)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
            .shadow(color: AppTheme.shadow, radius: 16, x: 0, y: 10)
            .accessibilityLabel(Text("Story illustration"))
            .onAppear { if !reduceMotion { animate = true } }
            .onDisappear { animate = false }
    }
    private var scale: CGFloat { guard !reduceMotion else { return 1 }; return animate && motionStyle != .none ? (motionStyle == .slowZoom ? 1.055 : 1.035) : 1 }
    private var xOffset: CGFloat { guard !reduceMotion else { return 0 }; switch motionStyle { case .driftLeft: return animate ? -parallaxAmount : parallaxAmount/2; case .driftRight, .subtleParallax: return animate ? parallaxAmount : -parallaxAmount/2; default: return 0 } }
    private var yOffset: CGFloat { guard !reduceMotion else { return 0 }; return motionStyle == .subtleParallax ? (animate ? -4 : 4) : 0 }
}
