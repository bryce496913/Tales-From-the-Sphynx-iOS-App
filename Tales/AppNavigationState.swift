//
//  AppNavigationState.swift
//  Tales
//
//  Lightweight app-level flow state for V1 navigation resets.
//

import SwiftUI

struct AdventureSession: Identifiable {
    let id = UUID()
}

@MainActor
final class AppNavigationState: ObservableObject {
    @Published var adventureSession: AdventureSession?

    func startNewAdventure() {
        adventureSession = AdventureSession()
    }

    func resetToMainMenu() {
        adventureSession = nil
        dismissPresentedAdventure()
    }

    func restartAdventure() {
        adventureSession = nil
        dismissPresentedAdventure { [weak self] in
            self?.adventureSession = AdventureSession()
        }
    }

    private func dismissPresentedAdventure(completion: (() -> Void)? = nil) {
        guard let rootViewController = activeRootViewController else {
            completion?()
            return
        }

        if rootViewController.presentedViewController == nil {
            completion?()
        } else {
            rootViewController.dismiss(animated: true, completion: completion)
        }
    }

    private var activeRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}
