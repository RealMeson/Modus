//
//  ModrinthFile.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthFile: Equatable, Hashable {
    var url: String
    var filename: String
    var primary: Bool
    var size: Int
    var hashes: ModrinthHash
}


 extension ModrinthFile: Decodable {
     enum CodingKeys: String, CodingKey {
         case url
         case filename
         case primary
         case size
         case hashes
     }
     
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         url = try container.decode(String.self, forKey: .url)
         filename = try container.decode(String.self, forKey: .filename)
         primary = try container.decode(Bool.self, forKey: .primary)
         size = try container.decode(Int.self, forKey: .size)
         hashes = try container.decode(ModrinthHash.self, forKey: .hashes)
     }
 }
 
