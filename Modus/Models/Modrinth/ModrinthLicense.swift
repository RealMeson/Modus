//
//  ModrinthLicense.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-05.
//

import Foundation

struct ModrinthLicense: Identifiable, Decodable, Hashable {
    var id: String
    var name: String
    var url: URL?
}
