//
//  IconModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-09.
//

import Foundation

struct IconModel: Hashable {
    enum IconType {
        case system, url
    }
    var type: IconType
    var source: String
}
