//
//  ModrinthUserModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthUserModel: Identifiable {
    var id: String
    var username: String
    var avatarUrl: String
    var created: String
    var role: ModrinthRole
    var name: String?
    var email: String?
    var bio: String?
    var githubId: Int?
}

extension ModrinthUserModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatarUrl = "avatar_url"
        case created
        case role
        case name
        case email
        case bio
        case githubId = "github_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        created = try container.decode(String.self, forKey: .created)
        role = try container.decode(ModrinthRole.self, forKey: .role)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        bio = try container.decodeIfPresent(String.self, forKey: .bio)
        githubId = try container.decodeIfPresent(Int.self, forKey: .githubId)
    }
}
