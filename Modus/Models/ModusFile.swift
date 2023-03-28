//
//  ModusFile.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-22.
//

import Foundation

struct ModusFile: Codable {
    var game: GameType = .minecraft
    var version: String
    var readme: String = "./readme.md"
}
