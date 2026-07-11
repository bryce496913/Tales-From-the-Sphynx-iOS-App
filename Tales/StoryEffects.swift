import SwiftUI

enum StoryTransitionStyle { case sandFade, torchReveal, stoneDoor }
enum TypewriterSpeed { case slow, normal, fast
    var delay: UInt64 { switch self { case .slow: 70_000_000; case .normal: 42_000_000; case .fast: 24_000_000 } }
    var batch: Int { switch self { case .slow: 1; case .normal: 2; case .fast: 3 } }
}
enum DustIntensity { case subtle, normal, heavy
    var count: Int { switch self { case .subtle: 16; case .normal: 24; case .heavy: 34 } }
}
enum DustDirection { case drifting }
enum StoryImageMotionStyle { case none, slowZoom, driftLeft, driftRight, subtleParallax }

struct StoryPageEffects {
    var entryTransition: StoryTransitionStyle = .sandFade
    var exitTransition: StoryTransitionStyle = .sandFade
    var typewriterSpeed: TypewriterSpeed = .normal
    var dustIntensity: DustIntensity = .normal
    var imageMotion: StoryImageMotionStyle = .slowZoom
    var choicesWaitForText: Bool = true
    static let standard = StoryPageEffects()
    static let torchLit = StoryPageEffects(entryTransition: .torchReveal, exitTransition: .torchReveal, dustIntensity: .normal, imageMotion: .driftRight)
    static let doorway = StoryPageEffects(entryTransition: .stoneDoor, exitTransition: .stoneDoor, imageMotion: .subtleParallax)
}

final class HapticManager {
    static let shared = HapticManager(); private init() {}
    func playChoicePress() { UIImpactFeedbackGenerator(style: .light).impactOccurred() }
    func playChoiceTap() { UIImpactFeedbackGenerator(style: .medium).impactOccurred() }
    func playTransition() { UISelectionFeedbackGenerator().selectionChanged() }
    func playGameOver() { UINotificationFeedbackGenerator().notificationOccurred(.warning) }
}
