//
//  ToolbarSelection.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-18.
//

import Foundation

enum ModlistViewType: String, CaseIterable, Identifiable {
    case compact, detailed, grid
    var id: Self { self }
}
