//
//  ModrinthVersionType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

enum ModrinthVersionType: String, CaseIterable, Identifiable, Codable, Equatable, Hashable {
    case alpha, beta, release
    var id: Self { self }
}
