//
//  ModrinthTeamMemberModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthTeamMemberModel: Decodable {
    var teamId: String
    var user: ModrinthUserModel
    var role: String
    var accepted: Bool
    var permissions: Int8
}
