//
//  ModrinthImage.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthImage: Decodable, Hashable {
    var url: URL
    var featured: Bool
    var title: String?
    var description: String?
    var created: String
}
