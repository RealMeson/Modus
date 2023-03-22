//
//  ModDetailsView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI
import MarkdownUI

struct ModDetailsView: View {
    @EnvironmentObject var modDetailsState: ModDetailsState

    var body: some View {
        VStack (alignment: .leading) {
            if (!modDetailsState.modDetails.isEmpty) {
                let image = modDetailsState.modDetails[0].gallery != nil && modDetailsState.modDetails[0].gallery?.count != 0 ? modDetailsState.modDetails[0].gallery![0].url : nil
                ModTitleCardView(title: modDetailsState.modDetails[0].title, authors: [], categories: modDetailsState.modDetails[0].categories + modDetailsState.modDetails[0].additionalCategories, image: image)
                ScrollView {
                    Markdown(modDetailsState.modDetails[0].body)
                }
                .padding(24)
            }
        }
        .padding(32)
        .onChange(of: modDetailsState.selection) { _ in
            modDetailsState.getModDetails()
        }
    }
}

struct ModDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        //let mod = ModrinthProjectModel(id: "id", title: "title", description: "description", categories: [.worldGeneration, .utility], additionalCategories: [], clientSide: "string", serverSide: "string", body: "body", projectType: "mod", downloads: 10, team: "team-id", published: "date", updated: "date", status: "release", versions: [ "version-1", "version-2" ])
        ModDetailsView().environmentObject(ModDetailsState())
    }
}
