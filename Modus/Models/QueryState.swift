//
//  ModrinthQuery.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-04.
//

import Foundation

struct Query: Equatable {
    enum Sorting {
        case relevance, downloads, follows, newest, updated
    }
    var projectType: ModrinthProjectType? = nil
    var categories = Set<String>()
    var query: String = ""
    var sorting: Sorting = .relevance
}
