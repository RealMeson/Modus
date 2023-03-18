//
//  ModrinthUserModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthUserModel: Identifiable, Decodable {
    var id: String
    var username: String
    var avatarUrl: String
    var created: Date
    var role: ModrinthRole
    var name: String?
    var email: String?
    var bio: String?
    var githubId: Int?
}
