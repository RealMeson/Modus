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
    
    @StateObject var modrinthStore = ModrinthStore()
    
    var body: some View {
        NavigationSplitView (columnVisibility: $columnVisibility) {
            SidebarView(selection: $selection)
                .navigationTitle("Categories")
        } content: {
        } detail: {
            Text("""
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut felis vel eros lobortis volutpat lacinia eu nunc. Praesent quis nibh vitae velit faucibus ullamcorper. Nulla vitae lorem facilisis, blandit enim ac, tincidunt libero. Ut commodo, dui vel ultricies commodo, enim mi volutpat odio, ac mattis justo urna eu dolor. In tincidunt urna libero, et feugiat libero congue ut. Suspendisse massa felis, consectetur in bibendum eget, luctus a eros. Sed eget eleifend odio, sed mattis nulla.

            Duis quis odio eu diam iaculis imperdiet et quis nisl. Fusce id erat et nisi venenatis laoreet quis nec arcu. Praesent tristique efficitur consequat. Vestibulum accumsan porttitor fringilla. Etiam et consequat urna. Curabitur posuere eleifend dignissim. Nulla vel nibh lacus. Sed tincidunt ex quis sem vehicula efficitur ut sit amet libero. Fusce id enim cursus, tempor enim in, convallis dui. Duis quam augue, placerat non iaculis nec, rutrum sit amet nulla. Vivamus porta, lacus ut mollis dictum, nisi neque sagittis nisl, et tempor ipsum ipsum sit amet est. Vestibulum faucibus consequat ante, vitae luctus libero semper sit amet. Aenean condimentum sagittis mauris a varius. Ut non justo et nisl viverra porta.

            Proin placerat rhoncus nisi, in congue nunc egestas eu. Nunc sodales blandit mi, ut tincidunt purus posuere nec. Nam varius nisi felis, sed iaculis leo egestas quis. Proin nec metus pulvinar, posuere elit blandit, laoreet turpis. Cras vitae accumsan massa. Morbi id dolor vitae lorem rutrum lacinia sed ac tortor. Aenean vel odio eu quam efficitur pellentesque vitae at metus. Praesent mollis cursus enim a tempus. Praesent pretium arcu ante, eget commodo sapien rhoncus in. Mauris sem neque, molestie ut metus sit amet, eleifend fermentum quam. Sed id lacinia libero, et ornare turpis. In vehicula dolor leo, eget luctus nunc laoreet non. Maecenas porta ligula vel turpis gravida, et malesuada eros facilisis. Vivamus id pellentesque lacus. Curabitur in tortor id sem dapibus semper.

            Cras dictum hendrerit ligula nec feugiat. Fusce ultricies hendrerit porttitor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque vitae diam ut sapien sagittis imperdiet a ut nibh. Nulla ipsum dolor, pulvinar et condimentum eget, dictum vitae ante. Cras id varius neque. Quisque lectus risus, efficitur ut tortor et, commodo imperdiet urna. In non elit maximus, eleifend eros ac, finibus arcu. Proin eu ornare erat, nec semper metus. Proin dapibus sem a arcu gravida accumsan.

            Cras sodales sit amet quam eu placerat. Curabitur lacus felis, volutpat in mauris eget, rutrum consectetur lectus. Sed justo sem, ultricies vel nisi in, blandit cursus diam. Vivamus ultrices turpis at justo varius consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum eu mi vitae dolor tempor condimentum eu eu libero. Etiam eros leo, convallis ac porta quis, auctor vel ante. Aenean et tincidunt diam. Donec ornare enim quis rutrum volutpat.
            """)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showSheet) {
            ModrinthView()
                .frame(minWidth: 1000, minHeight: 700)
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
