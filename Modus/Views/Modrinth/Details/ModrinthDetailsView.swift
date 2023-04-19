//
//  ModDetailsView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI
import MarkdownUI

enum Selection: String, CaseIterable, Identifiable {
    case description, gallery, issues
    var id: Self { self }
}

extension Selection {
    var icon: String {
        switch self.id {
        case .description:
            return "text.justify.left"
        case .gallery:
            return "photo"
        case .issues:
            return "exclamationmark.triangle"
        }
    }
}

extension Selection {
    var label: String {
        switch self.id {
        case .description:
            return "Description"
        case .gallery:
            return "Gallery"
        case .issues:
            return "Issues"
        }
    }
}


struct ModrinthDetailsView: View {
    let id: ModrinthProjectModel.ID
    @State var selection: Selection = .description

    @EnvironmentObject var projectState: ModrinthProjectState

    var body: some View {
        VStack {
            if let project = projectState.project {
                ModTitleCardView(id: project.id, title: project.title, teamId: project.team, categories: project.categories)
                Picker("Section", selection: $selection) {
                    Label(Selection.description.label, systemImage: Selection.description.icon).tag(Selection.description)
                    if let gallery = project.gallery, !gallery.isEmpty {
                        Label(Selection.gallery.label, systemImage: Selection.gallery.icon).tag(Selection.gallery)
                    }
                    if project.issuesUrl != nil {
                        Label(Selection.issues.label, systemImage: Selection.issues.icon).tag(Selection.issues)
                    }
                }
                .padding(.vertical, 4)
                .labelsHidden()
                .pickerStyle(.segmented)
                switch selection {
                case .description:
                    VStack (alignment: .leading) {
                        //let image = project.gallery != nil && project.gallery?.count != 0 ? project.gallery![0].url : nil
                        //ModTitleCardView(id: project.id, title: project.title, teamId: project.team, categories: project.categories + project.additionalCategories, image: image)
                        ScrollView {
                            Markdown(project.body)
                                .padding(.horizontal, 24)
                        }
                    }
                case .gallery:
                    if let gallery = project.gallery {
                        ModrinthGalleryView(gallery: gallery)
                    }
                case .issues:
                    if let issues = project.issuesUrl {
                        switch issues.host() {
                        case "github.com":
                            GitHubIssuesView(owner: issues.pathComponents[1], name: issues.pathComponents[2])
                        default:
                            Text("Issues source not supported")
                        }
                    }
                }
            }
        }
        .onAppear {
            print("hellO")
        }
        .padding(12)
        .task(id: id) {
            try? await projectState.getProject(id: id)
            selection = .description
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
