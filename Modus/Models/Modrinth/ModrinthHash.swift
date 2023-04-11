//
//  ModrinthHash.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthHash: Codable, Equatable, Hashable {
    var sha512: String
    var sha1: String
}
