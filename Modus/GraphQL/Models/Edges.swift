//
//  Edges.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-19.
//

import Foundation

struct Edges<T: Decodable>: Decodable {
    var edges: [Node<T>]

    enum CodingKeys: String, CodingKey {
        case edges
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        edges = try container.decode([Node<T>].self, forKey: .edges)
    }
}

extension Edges {
    var values: [T] {
        return edges.map { $0.node }
    }
}
