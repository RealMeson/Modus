//
//  GitHubIssuesModel.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-11.
//

import Foundation

enum GitHubIssueState: String, Identifiable, Codable {
    case open = "OPEN"
    case reopened = "REOPENED"
    case completed = "COMPLETED"
    case notPlanned = "NOT_PLANNED"
    
    var id: Self { self }
}

extension GitHubIssueState {
    var icon: String {
        switch self.id {
        case .open:
            return "circle"
        case .reopened:
            return "smallcircle.circle"
        case .completed:
            return "checkmark.circle"
        case .notPlanned:
            return "slash.circle"
        }
    }
}

struct GitHubIssueItem: Identifiable, Hashable {
    var id: String
    var title: String
    var number: Int
    var updated: Date
    var state: GitHubIssueState
    var labels: [GitHubLabelModel]

    var authorUsername: String
    var authorAvatarUrl: URL
    
    var totalComments: Int
}

extension GitHubIssueItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case number
        case stateReason
        case updated = "updatedAt"
        case labels
        case author
        case comments
        
        enum AuthorKeys: String, CodingKey {
            case authorUsername = "login"
            case authorAvatarUrl = "avatarUrl"
        }
        
        enum CommentsKeys: String, CodingKey {
            case totalComments = "totalCount"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        id = try container.decode(String.self, forKey: .id)
        number = try container.decode(Int.self, forKey: .number)
        state = try container.decodeIfPresent(GitHubIssueState.self, forKey: .stateReason) ?? .open
        let iso = try container.decode(String.self, forKey: .updated)
        updated = ISO8601DateFormatter().date(from: iso)!
        let edges = try container.decode(Edges<GitHubLabelModel>.self, forKey: .labels)
        labels = edges.values
        
        let authorContainer = try container.nestedContainer(keyedBy: CodingKeys.AuthorKeys.self, forKey: .author)
        authorUsername = try authorContainer.decode(String.self, forKey: .authorUsername)
        authorAvatarUrl = try authorContainer.decode(URL.self, forKey: .authorAvatarUrl)
        
        let commentsContainer = try container.nestedContainer(keyedBy: CodingKeys.CommentsKeys.self, forKey: .comments)
        totalComments = try commentsContainer.decode(Int.self, forKey: .totalComments)
    }
}
