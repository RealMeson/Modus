//
//  ModrinthDependency.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthDependency: Decodable {
    var dependencyType: ModrinthDependencyType
    var versionId: String?
    var projectId: String?
    var fileName: String?
}
