//
//  ModrinthDependency.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthDependency {
    var dependencyType: ModrinthDependencyType
    var versionId: String?
    var projectId: String?
    var fileName: String?
}

extension ModrinthDependency: Decodable {
    enum CodingKeys: String, CodingKey {
        case dependenyType = "dependency_type"
        case versionId = "version_id"
        case projectId = "project_id"
        case fileName = "file_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dependencyType = try container.decode(ModrinthDependencyType.self, forKey: .dependenyType)
        versionId = try container.decodeIfPresent(String.self, forKey: .versionId)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
    }
}

