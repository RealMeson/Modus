//
//  ModDetailsView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI
import MarkdownUI

struct ModrinthDetailsView: View {
    let id: ModrinthProjectModel.ID

    @EnvironmentObject var projectState: ModrinthProjectState

    var body: some View {
        TabView {
            if let project = projectState.project {
                VStack (alignment: .leading) {
                    //let image = project.gallery != nil && project.gallery?.count != 0 ? project.gallery![0].url : nil
                    //ModTitleCardView(id: project.id, title: project.title, teamId: project.team, categories: project.categories + project.additionalCategories, image: image)
                    ScrollView {
                        Markdown(project.body)
                    }
                    .padding(24)
                }
                .tabItem {
                    Label("Description", systemImage: "text.justify.left")
                }
                TeamView(id: project.team)
                    .tabItem {
                        Label("Authors", systemImage: "person.2")
                    }
                if let gallery = project.gallery, !gallery.isEmpty {
                    ModrinthGalleryView(gallery: gallery)
                        .tabItem {
                            Label("Gallery", systemImage: "photo")
                        }
                }
                /*
                if let issues = project.issuesUrl, issues.host?.contains("github.com") {
                }
                 */
            }
        }
        .padding(4)
        .task(id: id) {
            try? await projectState.getProject(id: id)
        }
    }
}

struct ModDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        //let mod = ModrinthProjectModel(id: "id", title: "title", description: "description", categories: [.worldGeneration, .utility], additionalCategories: [], clientSide: "string", serverSide: "string", body: "body", projectType: "mod", downloads: 10, team: "team-id", published: "date", updated: "date", status: "release", versions: [ "version-1", "version-2" ])
        ModrinthDetailsView(id: "9eGKb6K1")
            .environmentObject(ModrinthProjectState())
    }
}
