import SwiftUI

struct DustParticleOverlay: View {
    var intensity: DustIntensity = .normal
    var direction: DustDirection = .drifting
    var isEnabled: Bool = true
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    private let particles: [DustParticle]

    init(intensity: DustIntensity = .normal, direction: DustDirection = .drifting, isEnabled: Bool = true) {
        self.intensity = intensity
        self.direction = direction
        self.isEnabled = isEnabled
        self.particles = (0..<intensity.count).map { DustParticle(seed: Double($0 + 1)) }
    }

    @ViewBuilder
    var body: some View {
        if isEnabled {
            if reduceMotion {
                particleTimeline(schedule: .periodic(from: .now, by: 60))
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
                    .accessibilityHidden(true)
            } else {
                particleTimeline(schedule: .animation(minimumInterval: 1 / 30))
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
                    .accessibilityHidden(true)
            }
        }
    }

    private func particleTimeline<Schedule: TimelineSchedule>(schedule: Schedule) -> some View {
        TimelineView(schedule) { context in
            Canvas { ctx, size in
                let time = reduceMotion ? 0 : context.date.timeIntervalSinceReferenceDate
                let width = max(size.width, 1)
                let height = max(size.height, 1)

                for particle in particles {
                    let driftX = CGFloat(sin(time * particle.horizontalSpeed + particle.seed)) * particle.horizontalDrift
                    let baseX = particle.x * width
                    let wrappedX = (baseX + driftX + width).truncatingRemainder(dividingBy: width)

                    let baseY = particle.y * height
                    let travelY = CGFloat(time * particle.verticalSpeed).truncatingRemainder(dividingBy: height + 40)
                    let wrappedY = (baseY + travelY).truncatingRemainder(dividingBy: height + 40) - 20

                    let rect = CGRect(x: wrappedX, y: wrappedY, width: particle.size, height: particle.size)
                    let opacity = reduceMotion ? particle.opacity * 0.55 : particle.opacity
                    ctx.addFilter(.blur(radius: particle.blur))
                    ctx.fill(Path(ellipseIn: rect), with: .color(AppTheme.gold.opacity(opacity)))
                }
            }
        }
    }
}

private struct DustParticle {
    let seed: Double
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let opacity: Double
    let verticalSpeed: Double
    let horizontalSpeed: Double
    let horizontalDrift: CGFloat
    let blur: CGFloat

    init(seed: Double) {
        self.seed = seed
        x = CGFloat((seed * 0.37).truncatingRemainder(dividingBy: 1))
        y = CGFloat((seed * 0.61).truncatingRemainder(dividingBy: 1))
        size = CGFloat(2.2 + (seed.truncatingRemainder(dividingBy: 4.8)))
        opacity = 0.22 + (seed.truncatingRemainder(dividingBy: 6)) / 100
        verticalSpeed = 4.5 + seed.truncatingRemainder(dividingBy: 7)
        horizontalSpeed = 0.10 + (seed.truncatingRemainder(dividingBy: 5)) / 50
        horizontalDrift = CGFloat(16 + seed.truncatingRemainder(dividingBy: 18))
        blur = CGFloat(seed.truncatingRemainder(dividingBy: 1.2))
    }
}
