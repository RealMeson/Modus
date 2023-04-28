//
//  ModrinthVersionsState.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-01.
//

import Foundation

class ModrinthVersionsState: ObservableObject {
    @Published var versions: [ModrinthVersionModel] = []

    private let cache = Cache<ModrinthVersionModel.ID, ModrinthVersionModel>()

    func getVersions(_ ids: [ModrinthVersionModel.ID]) async throws {
        let filtered = ids.filter { id in
            let cached: ModrinthVersionModel? = cache[id]
            if (cached != nil) {
                self.versions.append(cached!)
                return false
            }
            return true
        }
        try Task.checkCancellation()

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.modrinth.com"
        components.path = "/v2/versions"
        components.queryItems = [
            URLQueryItem(name: "ids", value: filtered.description)
        ]
        let urlRequest = URLRequest(url: components.url!)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedVersions = try JSONDecoder().decode([ModrinthVersionModel].self, from: data)
        for version in versions {
            cache[version.id] = version
        }
        self.versions = decodedVersions
    }
}
