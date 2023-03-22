//
//  ModrinthSearchResponse.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthSearchResultResponse {
    var hits: [ModrinthSearchResultModel]
    var offset: Int
    var limit: Int
    var totalHits: Int
}

extension ModrinthSearchResultResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case hits
        case offset
        case limit
        case totalHits = "total_hits"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hits = try container.decode([ModrinthSearchResultModel].self, forKey: .hits)
        offset = try container.decode(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        totalHits = try container.decode(Int.self, forKey: .totalHits)
    }
}
