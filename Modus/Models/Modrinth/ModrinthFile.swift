//
//  ModrinthFile.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthFile: Decodable {
    var url: String
    var filename: String
    var primary: Bool
    var size: Int
    var hashes: [ModrinthHash]
}
