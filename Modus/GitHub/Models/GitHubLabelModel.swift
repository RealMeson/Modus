//
//  GitHubLabelModel.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-18.
//

import SwiftUI

struct GitHubLabelModel: Hashable {
    var name: String
    var description: String
    var colour: Color
}

extension GitHubLabelModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case colour = "color"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        let colourString = try container.decode(String.self, forKey: .colour)
        let black = UInt32("FF", radix: 16)!
        colour = Color(rgba: (UInt32(colourString, radix: 16)! << 8) | black)
    }
}
