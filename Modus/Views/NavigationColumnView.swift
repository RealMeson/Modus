//
//  NavigationColumnView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-03.
//

import SwiftUI

struct NavigationColumnView: View {
    @Environment(\.undoManager) var undoManager
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @EnvironmentObject var modlistState: ModlistState
    @EnvironmentObject var document: DocumentTestDocument
    
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
            ToolbarItem(id: "Download", placement: .primaryAction) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.down")
                }
            }
            
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
                    Text(Query.Sorting.relevance.label).tag(Query.Sorting.relevance)
                    Text(Query.Sorting.downloads.label).tag(Query.Sorting.downloads)
                    Text(Query.Sorting.follows.label).tag(Query.Sorting.follows)
                    Text(Query.Sorting.newest.label).tag(Query.Sorting.newest)
                    Text(Query.Sorting.updated.label).tag(Query.Sorting.updated)
                }
                .pickerStyle(.menu)
            }
            
            ToolbarItem(id: "Loader", placement: .secondaryAction) {
                Picker("Select Loader", selection: $modlistState.queryForm.loader) {
                    Label("All", systemImage: "circle").tag(nil as LoaderType?)
                    Section("Mods") {
                        Label(LoaderType.fabric.label, systemImage: LoaderType.fabric.icon).tag(LoaderType.fabric as LoaderType?)
                        Label(LoaderType.forge.label, systemImage: LoaderType.forge.icon).tag(LoaderType.forge as LoaderType?)
                        Label(LoaderType.liteloader.label, systemImage: LoaderType.liteloader.icon).tag(LoaderType.liteloader as LoaderType?)
                        Label(LoaderType.modloader.label, systemImage: LoaderType.modloader.icon).tag(LoaderType.modloader as LoaderType?)
                        Label(LoaderType.quilt.label, systemImage: LoaderType.quilt.icon).tag(LoaderType.quilt as LoaderType?)
                        Label(LoaderType.rift.label, systemImage: LoaderType.rift.icon).tag(LoaderType.rift as LoaderType?)
                    }
                }
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
