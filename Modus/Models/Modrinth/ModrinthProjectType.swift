//
//  ModrinthProjectType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-04.
//

import Foundation

enum ModrinthProjectType: Decodable, Hashable {
    case mod, modpack, resourcepack, shader
}
