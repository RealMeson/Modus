//
//  ModrinthTeamMemberModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthTeamMemberModel {
    var teamId: String
    var user: ModrinthUserModel
    var role: String
    var accepted: Bool
    var permissions: Int8?
    var payoutsSplit: Int?
    var ordering: Int?
}

extension ModrinthTeamMemberModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case teamId = "team_id"
        case user
        case role
        case accepted
        case permissions
        case payoutsSplit = "payouts_split"
        case ordering
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamId = try container.decode(String.self, forKey: .teamId)
        user = try container.decode(ModrinthUserModel.self, forKey: .user)
        role = try container.decode(String.self, forKey: .role)
        accepted = try container.decode(Bool.self, forKey: .accepted)
        permissions = try container.decodeIfPresent(Int8.self, forKey: .permissions)
        payoutsSplit = try container.decodeIfPresent(Int.self, forKey: .payoutsSplit)
        ordering = try container.decodeIfPresent(Int.self, forKey: .ordering)
        
    }
}
