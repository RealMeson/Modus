//
//  ModusApp.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-18.
//

import SwiftUI

@main
struct Modus: App {
    @StateObject var modrinthStore = ModrinthStore()
    var body: some Scene {
        DocumentGroup(newDocument: { DocumentTestDocument() }) { configuration in
            ModusView()
                .environmentObject(modrinthStore)
                .environmentObject(modrinthStore.projectState)
                .environmentObject(modrinthStore.modlistState)
                .environmentObject(modrinthStore.versionsState)
                .environmentObject(modrinthStore.teamState)
        }
        DocumentGroup(newDocument: { PlainTextDocument() }) { configuration in
            ModusView()
                .environmentObject(modrinthStore)
                .environmentObject(modrinthStore.projectState)
                .environmentObject(modrinthStore.modlistState)
                .environmentObject(modrinthStore.versionsState)
                .environmentObject(modrinthStore.teamState)
        }
    }
}

