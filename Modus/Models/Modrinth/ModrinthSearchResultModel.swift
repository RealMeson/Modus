//
//  ModrinthSearchResultModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthSearchResultModel: Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var categories: [String]
    var clientSide: String
    var serverSide: String
    var projectType: String
    var downloads: Int
    var iconUrl: String?
    var author: String
    var follows: Int
    var dateCreated: String
    var dateModified: String
    var latestVersion: String
    var versions: [String]
    var license: String?
    var gallery: [String]?
}

extension ModrinthSearchResultModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "project_id"
        case title
        case description
        case categories
        case clientSide = "client_side"
        case serverSide = "server_side"
        case projectType = "project_type"
        case downloads
        case iconUrl = "icon_url"
        case author
        case follows
        case dateCreated = "date_created"
        case dateModified = "date_modified"
        case latestVersion = "latest_version"
        case versions
        case license
        case gallery
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        categories = try container.decode([String].self, forKey: .categories)
        clientSide = try container.decode(String.self, forKey: .clientSide)
        serverSide = try container.decode(String.self, forKey: .serverSide)
        projectType = try container.decode(String.self, forKey: .projectType)
        downloads = try container.decode(Int.self, forKey: .downloads)
        iconUrl = try container.decodeIfPresent(String.self, forKey: .iconUrl)
        author = try container.decode(String.self, forKey: .author)
        follows = try container.decode(Int.self, forKey: .follows)
        dateCreated = try container.decode(String.self, forKey: .dateCreated)
        dateModified = try container.decode(String.self, forKey: .dateModified)
        latestVersion = try container.decode(String.self, forKey: .latestVersion)
        versions = try container.decode([String].self, forKey: .versions)
        license = try container.decode(String.self, forKey: .license)
        gallery = try container.decode([String].self, forKey: .gallery)
    }
}
