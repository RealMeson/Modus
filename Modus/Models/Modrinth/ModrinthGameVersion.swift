//
//  ModrinthGameVersion.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-21.
//

import Foundation

struct ModrinthGameVersion: Identifiable {
    enum VersionType: String, CaseIterable, Identifiable, Decodable {
        case release, snapshot, beta, alpha
        var id: Self { self }
    }
    let id: String
    let type: VersionType
    var isOn: Bool = false
    
}

extension ModrinthGameVersion: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "version"
        case type = "version_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(VersionType.self, forKey: .type)
    }
}
