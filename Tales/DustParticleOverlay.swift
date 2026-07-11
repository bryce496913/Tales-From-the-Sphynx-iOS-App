import SwiftUI

struct DustParticleOverlay: View {
    var intensity: DustIntensity = .normal
    var direction: DustDirection = .drifting
    var isEnabled: Bool = true

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let particles: [DustParticle]
    private let colors: [Color] = [
        AppTheme.warmText,
        AppTheme.sand,
        AppTheme.gold
    ]

    init(intensity: DustIntensity = .normal, direction: DustDirection = .drifting, isEnabled: Bool = true) {
        self.intensity = intensity
        self.direction = direction
        self.isEnabled = isEnabled
        self.particles = (0..<intensity.count).map { DustParticle(index: $0) }
    }

    @ViewBuilder
    var body: some View {
        if isEnabled, !particles.isEmpty {
            if reduceMotion {
                particleTimeline(schedule: .periodic(from: .now, by: 60))
            } else {
                particleTimeline(schedule: .animation(minimumInterval: 1 / 30))
            }
        }
    }

    private func particleTimeline<Schedule: TimelineSchedule>(schedule: Schedule) -> some View {
        TimelineView(schedule) { timeline in
            Canvas { context, size in
                let elapsed = reduceMotion ? 0 : timeline.date.timeIntervalSinceReferenceDate
                let width = max(size.width, 1)
                let height = max(size.height, 1)

                for particle in particles {
                    var particleContext = context
                    let yProgress = (particle.normalizedY + elapsed * particle.speed)
                        .truncatingRemainder(dividingBy: 1.2)
                    let xProgress = particle.normalizedX + sin(elapsed * 0.25 + particle.phase) * particle.drift
                    let wrappedX = positiveRemainder(xProgress, 1.0)

                    let x = CGFloat(wrappedX) * width
                    let y = CGFloat(yProgress / 1.2) * (height + 80) - 40
                    let rect = CGRect(
                        x: x - particle.size / 2,
                        y: y - particle.size / 2,
                        width: particle.size,
                        height: particle.size
                    )

                    if particle.size > 3 {
                        particleContext.addFilter(.blur(radius: 0.6))
                    }

                    let color = colors[particle.colorIndex % colors.count]
                    let opacity = reduceMotion ? particle.opacity * 0.65 : particle.opacity
                    particleContext.fill(Path(ellipseIn: rect), with: .color(color.opacity(opacity)))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private func positiveRemainder(_ value: Double, _ divisor: Double) -> Double {
        let remainder = value.truncatingRemainder(dividingBy: divisor)
        return remainder >= 0 ? remainder : remainder + divisor
    }
}

private struct DustParticle: Identifiable {
    let id = UUID()
    let normalizedX: Double
    let normalizedY: Double
    let size: CGFloat
    let speed: Double
    let drift: Double
    let phase: Double
    let opacity: Double
    let colorIndex: Int

    init(index: Int) {
        let seed = Double(index + 1)
        normalizedX = (seed * 0.38196601125).truncatingRemainder(dividingBy: 1)
        normalizedY = (seed * 0.61803398875).truncatingRemainder(dividingBy: 1)
        size = CGFloat(1.5 + (seed * 1.37).truncatingRemainder(dividingBy: 3.0))
        speed = 0.006 + (seed * 0.0017).truncatingRemainder(dividingBy: 0.012)
        drift = 0.012 + (seed * 0.0031).truncatingRemainder(dividingBy: 0.025)
        phase = seed * 1.73
        opacity = 0.18 + (seed * 0.047).truncatingRemainder(dividingBy: 0.30)
        colorIndex = index
    }
}
