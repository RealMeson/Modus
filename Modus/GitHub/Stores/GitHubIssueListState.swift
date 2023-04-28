//
//  GitHubIssuesStore.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-11.
//

import Foundation

@MainActor
class GithubIssueListState: ObservableObject {
    @Published var issues: [GitHubIssueItem]? = nil
    
    private struct IssuesResponse: Decodable {
        var issues: [GitHubIssueItem]
        
        enum CodingKeys: String, CodingKey {
            case data
            
            enum RepositoryKeys: String, CodingKey {
                case repository

                enum IssuesKeys: String, CodingKey {
                    case issues
                }
            }
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let repoContainer = try container.nestedContainer(keyedBy: CodingKeys.RepositoryKeys.self, forKey: .data)
            let issuesContainer = try repoContainer.nestedContainer(keyedBy: CodingKeys.RepositoryKeys.IssuesKeys.self, forKey: .repository)
            let edges = try issuesContainer.decode(Edges<GitHubIssueItem>.self, forKey: .issues)
            issues = edges.values
        }
    }

    func getIssuesFromRepository(owner: String, name: String) async throws {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/graphql"

        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer {BEARER_TOKEN}w", forHTTPHeaderField: "Authorization")
        let query = """
        {
          repository(owner: "\(owner)", name: "\(name)") {
            issues(first: 20, orderBy: {field: CREATED_AT, direction: DESC}) {
              edges {
                node {
                  id
                  title
                  number
                  stateReason
                  updatedAt
                  labels(first: 10) {
                    edges {
                      node {
                        color
                        description
                        name
                      }
                    }
                  }
                  author {
                    login
                    avatarUrl
                  }
                  comments {
                    totalCount
                  }
                }
              }
            }
          }
        }
        """
        let payload = Payload(query: query)
        request.httpBody = try! JSONEncoder().encode(payload)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedResponse = try JSONDecoder().decode(IssuesResponse.self, from: data)
        try Task.checkCancellation()
        self.issues = decodedResponse.issues
    }
}
