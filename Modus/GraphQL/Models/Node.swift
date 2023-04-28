//
//  Node.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-19.
//

import Foundation

struct Node<T: Decodable>: Decodable {
    var node: T

    enum CodingKeys: String, CodingKey {
        case node
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        node = try container.decode(T.self, forKey: .node)
    }
}
