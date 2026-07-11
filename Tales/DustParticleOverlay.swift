import SwiftUI

struct DustParticleOverlay: View {
    var intensity: DustIntensity = .subtle
    var direction: DustDirection = .drifting
    var isEnabled: Bool = true
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    private let particles: [DustParticle]
    init(intensity: DustIntensity = .subtle, direction: DustDirection = .drifting, isEnabled: Bool = true) {
        self.intensity = intensity; self.direction = direction; self.isEnabled = isEnabled
        self.particles = (0..<intensity.count).map { DustParticle(seed: Double($0 + 1)) }
    }
    var body: some View {
        if isEnabled {
            if reduceMotion {
                particleTimeline(schedule: .periodic(from: .now, by: 60))
            } else {
                particleTimeline(schedule: .animation(minimumInterval: 1/24))
            }
        }
    }

    private func particleTimeline<Schedule: TimelineSchedule>(schedule: Schedule) -> some View {
        TimelineView(schedule) { context in
            Canvas { ctx, size in
                let t = context.date.timeIntervalSinceReferenceDate
                for p in particles {
                    let x = (p.x * size.width + CGFloat(sin(t * p.speed + p.seed)) * 24).truncatingRemainder(dividingBy: max(size.width, 1))
                    let y = (p.y * size.height + CGFloat(t * p.speed * 8).truncatingRemainder(dividingBy: max(size.height, 1)))
                    let rect = CGRect(x: x, y: y.truncatingRemainder(dividingBy: max(size.height, 1)), width: p.size, height: p.size)
                    ctx.fill(Path(ellipseIn: rect), with: .color(AppTheme.sand.opacity(reduceMotion ? p.opacity * 0.35 : p.opacity)))
                }
            }
        }.allowsHitTesting(false).ignoresSafeArea().accessibilityHidden(true)
    }
}
private struct DustParticle { let seed: Double; let x: CGFloat; let y: CGFloat; let size: CGFloat; let opacity: Double; let speed: Double
    init(seed: Double) { self.seed = seed; x = CGFloat((seed * 0.37).truncatingRemainder(dividingBy: 1)); y = CGFloat((seed * 0.61).truncatingRemainder(dividingBy: 1)); size = CGFloat(1.5 + (seed.truncatingRemainder(dividingBy: 4))); opacity = 0.10 + (seed.truncatingRemainder(dividingBy: 5)) / 100; speed = 0.08 + (seed.truncatingRemainder(dividingBy: 7)) / 80 }
}
