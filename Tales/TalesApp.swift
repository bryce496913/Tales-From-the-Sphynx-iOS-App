//
//  TalesApp.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

import SwiftUI

@main
struct TalesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
