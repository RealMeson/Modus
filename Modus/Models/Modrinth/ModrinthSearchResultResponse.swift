//
//  ModrinthSearchResponse.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthSearchResultResponse: Decodable {
    var hits: [ModrinthSearchResultModel]
}
