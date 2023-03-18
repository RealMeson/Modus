//
//  ModlistView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI

struct ModlistView: View {
    @State private var modSelection = Set<String>()
    @EnvironmentObject var modlistState: ModlistState
    @EnvironmentObject var modDetailsState: ModDetailsState

    var body: some View {
        List(selection: $modDetailsState.selection) {
            ForEach (modlistState.modlist, id: \.id) { mod in
                ModlistModView(title: mod.title, icon: mod.iconUrl != nil ? IconModel(type: .url, source: mod.iconUrl!) : IconModel(type: .system, source: "circle"))
            }
            LoaderView(isFailed: modlistState.isRequestFailed, status: modlistState.status)
                .onAppear(perform: fetchData)
                .onTapGesture(perform: onTapLoadView)
        }
    }
    
    // 4
        private func fetchData() {
            if (modlistState.status != .end) {
                modlistState.getModlist()
            }
        }
        
        // 5
        private func onTapLoadView() {
            if modlistState.isRequestFailed {
                modlistState.isRequestFailed = false
                fetchData()
            }
        }
}

struct ModlistView_Previews: PreviewProvider {
    static var previews: some View {
        ModlistView()
            .environmentObject(ModlistState())
            .environmentObject(ModDetailsState())
    }
}
