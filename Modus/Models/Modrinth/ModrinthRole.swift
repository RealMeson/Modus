//
//  ModrinthRole.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

enum ModrinthRole: String, CaseIterable, Identifiable, Decodable {
    case admin, moderator, developer
    var id: Self { self }
}
