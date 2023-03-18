//
//  ModrinthPermissions.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthPermissions: OptionSet {
    let rawValue: Int8

    static let uploadVersion = ModrinthPermissions(rawValue: 1)
    static let deleteVersion = ModrinthPermissions(rawValue: 1 << 1)
    static let editDetails = ModrinthPermissions(rawValue: 1 << 2)
    static let editBody = ModrinthPermissions(rawValue: 1 << 3)
    static let manageInvites = ModrinthPermissions(rawValue: 1 << 4)
    static let removeMember = ModrinthPermissions(rawValue: 1 << 5)
    static let editMember = ModrinthPermissions(rawValue: 1 << 6)
    static let deleteProject = ModrinthPermissions(rawValue: 1 << 7)
}
