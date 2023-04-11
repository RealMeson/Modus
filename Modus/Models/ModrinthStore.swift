//
//  ModlistState.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-07.
//

import Foundation

@MainActor
class ModrinthStore: ObservableObject {
    var modlistState = ModlistState()
    var projectState = ModrinthProjectState()
    var versionsState = ModrinthVersionsState()
    var teamState = ModrinthTeamState()
}
