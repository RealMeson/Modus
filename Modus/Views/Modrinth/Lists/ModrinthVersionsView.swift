//
//  ModrinthProjectView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-01.
//

import SwiftUI

struct ModrinthVersionsView: View {
    @State var ids: [ModrinthVersionModel.ID]
    @EnvironmentObject var versionsState: ModrinthVersionsState

    @State var viewSelection = ModlistViewType.compact
    
    private var sortedVersions: [ModrinthVersionModel.ID:[ModrinthVersionModel]] {
        return Dictionary(grouping: versionsState.versions, by: { $0.name })
    }
    
    var body: some View {
        List {
            ForEach(Array(sortedVersions.keys.sorted(by: >)), id: \.self) { key in
                Section(header: Text("\(key)")) {
                    ForEach(sortedVersions[key]!, id: \.id) { version in
                        Text("\(version.id)")
                    }
                }
            }
        }
        .task {
            try? await versionsState.getVersions(ids)
        }
    }
}

struct ModrinthVersionsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModrinthVersionsView(ids: ["a68GgwWQ"])
                .environmentObject(ModrinthVersionsState())
        }
    }
}


