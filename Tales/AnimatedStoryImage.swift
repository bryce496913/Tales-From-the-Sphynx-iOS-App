import SwiftUI

struct AnimatedStoryImage: View {
    let imageName: String
    var motionStyle: StoryImageMotionStyle = .slowZoom
    var accessibilityLabel: String = "Story illustration"
    var parallaxAmount: CGFloat = 8

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isAnimating = false
    @State private var hasStartedAnimation = false

    var body: some View {
        Image(uiImage: UIImage(named: imageName) ?? UIImage(named: imageName.replacingOccurrences(of: ".png", with: "")) ?? UIImage())
            .resizable()
            .scaledToFill()
            .scaleEffect(scale)
            .offset(x: xOffset, y: yOffset)
            .frame(maxWidth: .infinity)
            .frame(height: 230)
            .clipped()
            .padding(8)
            .background(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).fill(AppTheme.cardAlt))
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous).stroke(AppTheme.gold.opacity(0.55), lineWidth: 1))
            .shadow(color: AppTheme.shadow, radius: 16, x: 0, y: 10)
            .accessibilityLabel(Text(accessibilityLabel))
            .onAppear { startAnimation() }
            .onDisappear { }
            .onChange(of: reduceMotion) { _ in startAnimation() }
            .onChange(of: motionStyle) { _ in startAnimation() }
    }

    private var animationDuration: Double { 12 }

    private var movementDisabled: Bool {
        reduceMotion || motionStyle == .none
    }

    private var scale: CGFloat {
        guard !movementDisabled else { return 1.0 }
        switch motionStyle {
        case .slowZoom: return isAnimating ? 1.07 : 1.0
        case .driftLeft, .driftRight, .subtleParallax: return isAnimating ? 1.05 : 1.0
        case .none: return 1.0
        }
    }

    private var xOffset: CGFloat {
        guard !movementDisabled else { return 0 }
        switch motionStyle {
        case .driftLeft: return isAnimating ? -parallaxAmount : parallaxAmount
        case .driftRight: return isAnimating ? parallaxAmount : -parallaxAmount
        case .subtleParallax: return isAnimating ? parallaxAmount * 0.75 : -parallaxAmount * 0.75
        case .slowZoom: return isAnimating ? 5 : -5
        case .none: return 0
        }
    }

    private var yOffset: CGFloat {
        guard !movementDisabled else { return 0 }
        switch motionStyle {
        case .slowZoom: return isAnimating ? -3 : 3
        case .subtleParallax: return isAnimating ? -4 : 4
        case .driftLeft, .driftRight, .none: return 0
        }
    }

    private func startAnimation() {
        guard !movementDisabled else {
            isAnimating = false
            hasStartedAnimation = false
            return
        }

        guard !hasStartedAnimation else { return }
        hasStartedAnimation = true
        isAnimating = false
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}
