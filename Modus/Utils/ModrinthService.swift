//
//  ModrinthService.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-07.
//

import Foundation
import Combine

class ModrinthAPIService {
    static let shared = ModrinthAPIService()
    // 1
    func getModlist(limit: Int = 20, offset: Int = 0, query: String = "", categories: Set<String> = Set<String>(), sorting: Query.Sorting = .relevance, loader: LoaderType? = nil) -> AnyPublisher<[ModrinthSearchResultModel], Error> {
        // 2
        var components = URLComponents(string: "https://api.modrinth.com/v2/search")!
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "index", value: "\(sorting.rawValue)")
        ]
        let initial = loader != nil ? "[\"categories:\(loader!.rawValue)\"]" : ""
        let reduced = categories.reduce(initial, { string, category in
            return string + (string.isEmpty ? "" : ",") + "[\"categories:\(category)\"]"
        })
        if (!reduced.isEmpty) {
            queries.append(URLQueryItem(name: "facets", value: "[\(reduced)]"))
        }

        if (!query.isEmpty) {
            queries.append(URLQueryItem(name: "query", value: query))
        }
        components.queryItems = queries
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: ":", with: "%3A")

        // 3
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        // 4
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ModrinthSearchResultResponse.self, decoder: JSONDecoder())
            .map(\.hits)
            .eraseToAnyPublisher()
    }
    
    func getMod(_ id: String) -> AnyPublisher<ModrinthProjectModel, Error> {
        let components = URLComponents(string: "https://api.modrinth.com/v2/project/\(id)")!
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ModrinthProjectModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
