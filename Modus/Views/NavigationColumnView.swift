//
//  NavigationColumnView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-03.
//

import SwiftUI

struct NavigationColumnView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @EnvironmentObject var modlistState: ModlistState
    
    @State var selection: Int = 0
    
    var body: some View {
        NavigationSplitView (columnVisibility: $columnVisibility) {
            SidebarView(selection: $selection)
                .navigationTitle("Categories")
        } content: {
            ModlistView()
                .navigationTitle("Mods")
        } detail: {
            ModDetailsView()
                .navigationTitle("Details")
        }
        .navigationSplitViewStyle(.balanced)
        .searchable(text: $modlistState.queryForm.query)
        .onChange(of: modlistState.queryForm) { _ in
            modlistState.getModlist(refresh: true)
        }
    }
}

struct NavigationColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationColumnView()
                .environmentObject(ModlistState())
                .environmentObject(ModDetailsState())
        }
    }
}
