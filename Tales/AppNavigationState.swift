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

final class AppNavigationState: ObservableObject {
    @Published var adventureSession: AdventureSession?

    func startNewAdventure() {
        adventureSession = AdventureSession()
    }

    func resetToMainMenu() {
        adventureSession = nil
    }

    func restartAdventure() {
        adventureSession = nil

        DispatchQueue.main.async { [weak self] in
            self?.adventureSession = AdventureSession()
        }
    }
}
