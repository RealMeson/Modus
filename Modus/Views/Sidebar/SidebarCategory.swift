//
//  SidebarCategory.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI

struct SidebarCategory: View {
    let category: ModrinthCategoryType
    let showText = true

    var body: some View {
        switch category {
        case .adventure:
            Label("Adventure", systemImage: "safari")
        case .cursed:
            Label("Cursed", systemImage: "ant")
        case .decoration:
            Label("Decoration", systemImage: "house")
        case .economy:
            Label("Economy", systemImage: "dollarsign")
        case .equipment:
            Label("Equipment", systemImage: "tshirt")
        case .food:
            Label("Food", systemImage: "carrot")
        case .gameMechanics:
            Label("Game Mechanics", systemImage: "slider.vertical.3")
        case .library:
            Label("Library", systemImage: "book.closed")
        case .magic:
            Label("Magic", systemImage: "wand.and.stars")
        case .management:
            Label("Management", systemImage: "server.rack")
        case .minigame:
            Label("Minigame", systemImage: "flag.checkered")
        case .mobs:
            Label("Mobs", systemImage: "figure.stand")
        case .optimization:
            Label("Optimization", systemImage: "bolt")
        case .social:
            Label("Social", systemImage: "bubble.right")
        case .storage:
            Label("Storage", systemImage: "archivebox")
        case .technology:
            Label("Technology", systemImage: "externaldrive")
        case .transportation:
            Label("Transportation", systemImage: "box.truck")
        case .utility:
            Label("Utility", systemImage: "briefcase")
        case .worldGeneration:
            Label("World Generation", systemImage: "globe.americas")
        default:
            Label("default", systemImage: "circle")
        }
    }
}

struct SidebarCategory_Previews: PreviewProvider {
    static var previews: some View {
        SidebarCategory(category: .adventure)
    }
}
