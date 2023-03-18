//
//  ModlistItemModel.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-15.
//

import Foundation

struct ModlistItemModel: Identifiable, Hashable {
    var id: String
    var title: String
    var icon: IconModel
}
