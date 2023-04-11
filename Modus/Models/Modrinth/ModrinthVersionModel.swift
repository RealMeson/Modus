//
//  ModrinthVersionModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthVersionModel: Identifiable {
    var id: String
    var projectId: String
    var authorId: String
    var name: String
    var versionNumber: String
    var gameVersions: [String]
    var versionType: ModrinthVersionType
    var loaders: [String]
    var featured: Bool
    var datePublished: String
    var downloads: Int
    var files: [ModrinthFile]
    var changelog: String?
    var dependencies: [ModrinthDependency]
}

extension ModrinthVersionModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case projectId = "project_id"
        case authorId = "author_id"
        case name
        case versionNumber = "version_number"
        case gameVersions = "game_versions"
        case versionType = "version_type"
        case loaders
        case featured
        case datePublished = "date_published"
        case downloads
        case files
        case changelog
        case dependencies
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        projectId = try container.decode(String.self, forKey: .projectId)
        authorId = try container.decode(String.self, forKey: .authorId)
        name = try container.decode(String.self, forKey: .name)
        versionNumber = try container.decode(String.self, forKey: .versionNumber)
        gameVersions = try container.decode([String].self, forKey: .gameVersions)
        versionType = try container.decode(ModrinthVersionType.self, forKey:.versionType)
        loaders = try container.decode([String].self, forKey: .loaders)
        featured = try container.decode(Bool.self, forKey: .featured)
        datePublished = try container.decode(String.self, forKey: .datePublished)
        downloads = try container.decode(Int.self, forKey: .downloads)
        files = try container.decode([ModrinthFile].self, forKey: .files)
        changelog = try container.decodeIfPresent(String.self, forKey: .changelog)
        dependencies = try container.decode([ModrinthDependency].self, forKey: .dependencies)
    }
}
