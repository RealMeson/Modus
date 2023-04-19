//
//  GitHubLabelModel.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-18.
//

import Foundation

struct GitHubLabelModel: Hashable {
    var name: String
    var description: String
    var colour: UInt32
    var textColour: UInt32
}

extension GitHubLabelModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case node
        
        enum NodeKeys: String, CodingKey {
            case name
            case description
            case colour = "color"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nodeContainer = try container.nestedContainer(keyedBy: CodingKeys.NodeKeys.self, forKey: .node)
        name = try nodeContainer.decode(String.self, forKey: .name)
        description = try nodeContainer.decode(String.self, forKey: .description)
        let colourString = try nodeContainer.decode(String.self, forKey: .colour)
        let black = UInt32("FF", radix: 16)!
        let colourInt = (UInt32(colourString, radix: 16)! << 8) | black
        colour = colourInt
        let r = colourInt >> 24
        let g = (colourInt >> 16) & black
        let b = (colourInt >> 8) & black
        let lum = 0.2126 * Float(r) + 0.7152 * Float(g) + 0.0722 * Float(b)
        textColour = lum < 0.50 ? black : UInt32("FFFFFFFF", radix: 16)!
    }
}
