//
//  SidebarModrinthView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI

let modCategories: [ModrinthCategoryType] = [
    .adventure,
    .cursed,
    .decoration,
    .economy,
    .equipment,
    .food,
    .gameMechanics,
    .library,
    .magic,
    .management,
    .minigame,
    .mobs,
    .optimization,
    .social,
    .storage,
    .technology,
    .transportation,
    .utility,
    .worldGeneration
]



struct SidebarModrinthView: View {
    @EnvironmentObject var modlistState: ModlistState

    var body: some View {
        List(selection: $modlistState.queryForm.categories) {
            Section(header: Text("Mods")) {
                ForEach(modCategories, id: \.rawValue) { category in
                    SidebarCategory(category: category)
                }
            }
        }
    }
}

struct SidebarModrinthView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarModrinthView().environmentObject(ModlistState())
    }
}
