//
//  ModrinthVersionModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthVersionModel: Identifiable, Decodable {
    var id: String
    var projectId: String
    var authorId: String
    var name: String
    var versionNumber: String
    var gameVersions: [String]
    var versionType: ModrinthVersionType
    var loaders: [String]
    var featured: Bool
    var datePublished: Date
    var downloads: Int
    var files: [ModrinthFile]
    var changelog: String?
    var dependencies: ModrinthDependencyType
}
