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

struct GitHubIssueModel: Identifiable, Hashable {
    var id: String
    var title: String
    var state: GitHubIssueState
    var labels: [GitHubLabelModel]
}

extension GitHubIssueModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case node
        
        enum NodeKeys: String, CodingKey {
            case id
            case title
            case stateReason
            case labels

            enum EdgesKeys: String, CodingKey {
                case edges
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nodeContainer = try container.nestedContainer(keyedBy: CodingKeys.NodeKeys.self, forKey: .node)
        title = try nodeContainer.decode(String.self, forKey: .title)
        id = try nodeContainer.decode(String.self, forKey: .id)
        state = try nodeContainer.decodeIfPresent(GitHubIssueState.self, forKey: .stateReason) ?? .open
        
        let labelsContainer = try nodeContainer.nestedContainer(keyedBy: CodingKeys.NodeKeys.EdgesKeys.self, forKey: .labels)
        labels = try labelsContainer.decode([GitHubLabelModel].self, forKey: .edges)
    }
}
