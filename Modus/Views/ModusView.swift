//
//  NavigationColumnView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-03.
//

import SwiftUI

struct ModusView: View {
    @Environment(\.undoManager) var undoManager

    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    @State var selection: Int = 0
    @State var viewSelection = ModlistViewType.compact
    @State private var showSheet = false
    
    var body: some View {
        NavigationSplitView (columnVisibility: $columnVisibility) {
            SidebarView(selection: $selection)
                .navigationTitle("Categories")
        } content: {
        } detail: {
        }
        .sheet(isPresented: $showSheet) {
            ModrinthView()
                .frame(minWidth: 1000, minHeight: 700)
        }
        .navigationSplitViewStyle(.balanced)
        .toolbar {
            ToolbarItem(id: "ListView", placement: .secondaryAction) {
                Picker("List View Type", selection: $viewSelection) {
                    Label("Grid", systemImage: "square.grid.2x2").tag(ModlistViewType.grid)
                    Label("Compact", systemImage: "list.bullet").tag(ModlistViewType.compact)
                    Label("Detailed", systemImage: "note.text").tag(ModlistViewType.detailed)
                }
                .pickerStyle(.inline)
            }
            ToolbarItem(id: "add", placement: .primaryAction) {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ModusView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModusView()
        }
    }
}
