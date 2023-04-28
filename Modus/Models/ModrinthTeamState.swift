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
class ModrinthTeamState: ObservableObject {
    @Published var team: [ModrinthTeamMemberModel]? = nil

    private let cache = Cache<String, [ModrinthTeamMemberModel]>()
    
    func getTeam(id: String) async throws {
        let cached: [ModrinthTeamMemberModel]? = cache[id]
        if (cached != nil) {
            try Task.checkCancellation()
            team = cached
        } else {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.modrinth.com"
            components.path = "/v2/team/\(id)/members"
            let urlRequest = URLRequest(url: components.url!)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedTeam = try JSONDecoder().decode([ModrinthTeamMemberModel].self, from: data)
            if (!decodedTeam.isEmpty) {
                cache[decodedTeam[0].teamId] = decodedTeam
                try Task.checkCancellation()
                team = decodedTeam
            } else {
                try Task.checkCancellation()
                team = nil
            }
        }
    }
}
