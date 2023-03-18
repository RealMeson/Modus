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
    @State var viewSelection = ModlistViewType.compact
    
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
        .toolbar {
            ToolbarItem(id: "ListView", placement: .secondaryAction) {
                Picker("List View Type", selection: $viewSelection) {
                    Label("Grid", systemImage: "square.grid.2x2").tag(ModlistViewType.grid)
                    Label("Compact", systemImage: "list.bullet").tag(ModlistViewType.compact)
                    Label("Detailed", systemImage: "note.text").tag(ModlistViewType.detailed)
                }
                .pickerStyle(.inline)
            }
            
            ToolbarItem(id: "Sorting", placement: .secondaryAction) {
                Picker("Sort by", selection: $modlistState.queryForm.sorting) {
                    Text("Relevance").tag(Query.Sorting.relevance)
                    Text("Downloads").tag(Query.Sorting.downloads)
                    Text("Follows").tag(Query.Sorting.follows)
                    Text("Newest").tag(Query.Sorting.newest)
                    Text("Updated").tag(Query.Sorting.updated)
                }
                .pickerStyle(.menu)
            }
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
