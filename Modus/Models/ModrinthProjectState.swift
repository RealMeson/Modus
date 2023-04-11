//
//  ModrinthProjectState.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-07.
//

import Foundation
import Combine
import SwiftSoup

@MainActor
class ModrinthProjectState: ObservableObject {
    @Published var project: ModrinthProjectModel? = nil

    private let cache = Cache<ModrinthProjectModel.ID, ModrinthProjectModel>()
    
    func getProject(id: ModrinthProjectModel.ID) async throws {
        let cached: ModrinthProjectModel? = cache[id]
        if (cached != nil) {
            try Task.checkCancellation()
            project = cached
        } else {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.modrinth.com"
            components.path = "/v2/project/\(id)"
            let urlRequest = URLRequest(url: components.url!)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedProject = try JSONDecoder().decode(ModrinthProjectModel.self, from: data)
            cache[decodedProject.id] = decodedProject
            try Task.checkCancellation()
            project = decodedProject
        }
    }
}
