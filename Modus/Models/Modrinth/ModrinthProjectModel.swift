//
//  ModrinthMod.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-04.
//

import Foundation

struct ModrinthProjectModel: Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var categories: [ModrinthCategoryType]
    var additionalCategories: [ModrinthCategoryType]
    var clientSide: String
    var serverSide: String
    var body: String
    var projectType: String
    var downloads: Int
    var team: String
    var published: String
    var updated: String
    var status: String
    var issuesUrl: URL?
    var sourceUrl: URL?
    var wikiUrl: URL?
    var discordUrl: URL?
    var donationsUrl: URL?
    var iconUrl: URL?
    var license: ModrinthLicense?
    var versions: [String]
    var gallery: [ModrinthImage]?
}

extension ModrinthProjectModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case categories
        case additionalCategories = "additional_categories"
        case clientSide = "client_side"
        case serverSide = "server_side"
        case body
        case projectType = "project_type"
        case downloads
        case team
        case published
        case updated
        case status
        case issuesUrl = "issues_url"
        case sourceUrl = "source_url"
        case wikiUrl = "wiki_url"
        case discordUrl = "discord_url"
        case donationsUrl = "donations_url"
        case iconUrl = "icon_url"
        case license
        case versions
        case gallery
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        categories = try container.decode([ModrinthCategoryType].self, forKey: .categories)
        additionalCategories = try container.decode([ModrinthCategoryType].self, forKey: .additionalCategories)
        clientSide = try container.decode(String.self, forKey: .clientSide)
        serverSide = try container.decode(String.self, forKey: .serverSide)
        body = try container.decode(String.self, forKey: .body)
        projectType = try container.decode(String.self, forKey: .projectType)
        downloads = try container.decode(Int.self, forKey: .downloads)
        team = try container.decode(String.self, forKey: .team)
        published = try container.decode(String.self, forKey: .published)
        updated = try container.decode(String.self, forKey: .updated)
        status = try container.decode(String.self, forKey: .status)
        issuesUrl = try container.decodeIfPresent(URL.self, forKey: .issuesUrl)
        sourceUrl = try container.decodeIfPresent(URL.self, forKey: .sourceUrl)
        wikiUrl = try container.decodeIfPresent(URL.self, forKey: .wikiUrl)
        discordUrl = try container.decodeIfPresent(URL.self, forKey: .discordUrl)
        donationsUrl = try container.decodeIfPresent(URL.self, forKey: .donationsUrl)
        iconUrl = try container.decodeIfPresent(URL.self, forKey: .iconUrl)
        license = try container.decode(ModrinthLicense.self, forKey: .license)
        versions = try container.decode([String].self, forKey: .versions)
        gallery = try container.decodeIfPresent([ModrinthImage].self, forKey: .gallery)
    }
}
