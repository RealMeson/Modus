//
//  ModrinthDependencyType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

enum ModrinthDependencyType: String, CaseIterable, Identifiable, Codable, Equatable, Hashable {
    case required, optional, incompatible, embedded
    var id: Self { self }
}
