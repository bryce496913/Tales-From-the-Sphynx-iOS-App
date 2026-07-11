import SwiftUI

struct ChoiceButton: View {
    let title: String
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    let action: () -> Void
    @State private var isPressed = false

    init(_ title: String, width: CGFloat? = nil, height: CGFloat? = nil, action: @escaping () -> Void) {
        self.title = title
        self.width = width
        self.height = height
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.headline, design: .serif).weight(.semibold))
                .foregroundColor(Color(hex: "1E140B"))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .minimumScaleFactor(0.82)
                .padding(.horizontal, 18)
                .padding(.vertical, 14)
                .frame(width: width, height: height)
                .frame(maxWidth: width == nil ? .infinity : nil, minHeight: height == nil ? 54 : nil)
                .background(
                    RoundedRectangle(cornerRadius: AppTheme.buttonRadius, style: .continuous)
                        .fill(LinearGradient(colors: [Color(hex: "F1D48A"), AppTheme.gold], startPoint: .top, endPoint: .bottom))
                        .overlay(RoundedRectangle(cornerRadius: AppTheme.buttonRadius, style: .continuous).stroke(AppTheme.sand.opacity(0.85), lineWidth: 1))
                        .shadow(color: AppTheme.gold.opacity(0.22), radius: 10, x: 0, y: 5)
                )
        }
        .buttonStyle(.plain)
        .scaleEffect(isPressed ? 0.97 : 1)
        .simultaneousGesture(DragGesture(minimumDistance: 0).onChanged { _ in isPressed = true }.onEnded { _ in isPressed = false })
        .animation(.spring(response: 0.22, dampingFraction: 0.72), value: isPressed)
    }
}
