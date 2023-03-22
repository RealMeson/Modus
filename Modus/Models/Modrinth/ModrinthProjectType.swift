//
//  ModrinthProjectType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-04.
//

import Foundation

enum ModrinthProjectType: String, CaseIterable, Identifiable, Decodable {
    case mod, modpack, resourcepack, shader
    var id: Self { self }
}

extension ModrinthProjectType {
    var label: String {
        switch self.id {
        case .mod:
            return "Mods"
        case .modpack:
            return "Modpacks"
        case .resourcepack:
            return "Resource Packs"
        case .shader:
            return "Shaders"
        }
    }
}
