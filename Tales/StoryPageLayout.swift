import SwiftUI

typealias StoryPageView<Content: View> = StoryPageLayout<Content>
typealias StoryImageView = AnimatedStoryImage
typealias TypewriterTextView = TypewriterText

struct StoryPageLayout<Content: View>: View {
    let imageName: String
    let title: String?
    let text: String
    var effects: StoryPageEffects
    @ViewBuilder let choices: Content
    @State private var appeared = false
    @State private var textComplete = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    init(imageName: String, title: String? = nil, text: String, effects: StoryPageEffects = .standard, @ViewBuilder choices: () -> Content) {
        self.imageName = imageName
        self.title = title
        self.text = text
        self.effects = effects
        self.choices = choices()
    }

    var body: some View {
        StoryTransitionContainer(style: reduceMotion ? .sandFade : effects.entryTransition) {
            ZStack {
                EgyptianBackground()
                    .ignoresSafeArea()

                DustParticleOverlay(intensity: effects.dustIntensity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                    .accessibilityHidden(true)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        ZStack {
                            AnimatedStoryImage(imageName: imageName, motionStyle: effects.imageMotion)
                            DustParticleOverlay(intensity: effects.dustIntensity)
                                .clipShape(RoundedRectangle(cornerRadius: AppTheme.imageRadius, style: .continuous))
                                .allowsHitTesting(false)
                                .accessibilityHidden(true)
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            if let title {
                                Text(title)
                                    .font(.system(.title2, design: .serif).weight(.bold))
                                    .foregroundColor(AppTheme.gold)
                            }

                            TypewriterText(
                                text: text,
                                speed: effects.typewriterSpeed,
                                startDelay: reduceMotion ? 0 : 0.45,
                                isEnabled: !reduceMotion
                            ) {
                                textComplete = true
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .goldCard()
                        .contentShape(Rectangle())

                        VStack(spacing: 12) {
                            choices
                        }
                        .frame(maxWidth: .infinity)
                        .opacity(choicesVisible ? 1 : 0)
                        .disabled(!choicesVisible)
                        .animation(.easeOut(duration: 0.3), value: choicesVisible)
                    }
                    .padding(.horizontal, AppTheme.screenPadding)
                    .padding(.top, 18)
                    .padding(.bottom, 24)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 10)
                }
                .zIndex(1)
            }
        }
        .onAppear {
            textComplete = reduceMotion || !effects.choicesWaitForText
            withAnimation(.easeOut(duration: 0.45)) { appeared = true }
        }
        .onDisappear {
            appeared = false
            textComplete = false
        }
    }

    private var choicesVisible: Bool { !effects.choicesWaitForText || textComplete || reduceMotion }
}
