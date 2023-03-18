//
//  ModrinthDependencyType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

enum ModrinthDependencyType: Decodable {
    case required, optional, incompatible, embedded
}
