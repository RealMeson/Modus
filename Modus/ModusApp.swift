//
//  ModusApp.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-16.
//

import SwiftUI

@main
struct ModusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
