//
//  ContentView.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-18.
//
import SwiftUI

struct ModrinthView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State var selection: ModrinthProjectModel.ID? = nil

    @EnvironmentObject var modlistState: ModlistState
    @State var viewSelection = ModlistViewType.compact
    @State var search: String = ""
    
    var body: some View {
        NavigationSplitView (columnVisibility: $columnVisibility) {
            SidebarModrinthView()
                .navigationTitle("Categories")
                .navigationSplitViewColumnWidth(175)
        } content: {
            ModlistView(selection: $selection)
                .navigationTitle("Modrinth")
        } detail: {
            if let id = selection {
                ModrinthDetailsView(id: id)
            } else {
                Text("Select project")
            }
        }
        /*
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
         */
    }
}

struct ModrinthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModrinthView()
                .environmentObject(ModlistState())
                .environmentObject(ModrinthVersionsState())
        }
    }
}

