//
//  ModusApp.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-18.
//

import SwiftUI

@main
struct Modus: App {
    var body: some Scene {
        DocumentGroup(newDocument: DocumentTestDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

