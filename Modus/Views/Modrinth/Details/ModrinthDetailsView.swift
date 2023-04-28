//
//  ModDetailsView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI
import MarkdownUI
import NukeUI

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

struct EffectView: NSViewRepresentable {
    @State var material: NSVisualEffectView.Material = .headerView
    @State var blendingMode: NSVisualEffectView.BlendingMode = .withinWindow

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
        nsView.blendingMode = blendingMode
    }
}

struct ModrinthDetailsView: View {
    let id: ModrinthProjectModel.ID
    @State var selection: Selection = .description

    @EnvironmentObject var projectState: ModrinthProjectState

    var body: some View {
        ScrollView {
            if let project = projectState.project {
                StickyHeader {
                    if !project.gallery.isEmpty {
                        LazyImage(url: project.gallery[0].url) { state in
                            if let image = state.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                    } else {
                        Image("MinecraftDirtTexture")
                            .resizable(resizingMode: .tile)
                    }
                }
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(alignment: .leading, spacing: 16) {
                            Picker("Section", selection: $selection) {
                                Label(Selection.description.label, systemImage: Selection.description.icon).tag(Selection.description)
                                if !project.gallery.isEmpty {
                                    Label(Selection.gallery.label, systemImage: Selection.gallery.icon).tag(Selection.gallery)
                                }
                                if project.issuesUrl != nil {
                                    Label(Selection.issues.label, systemImage: Selection.issues.icon).tag(Selection.issues)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(.segmented)

                            switch selection {
                            case .description:
                                Markdown(project.body)
                            case .gallery:
                                ModrinthGalleryView(gallery: project.gallery)
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
                        .padding(.horizontal, 32)
                        .padding(.bottom, 32)
                    } header: {
                        Group {
                            HStack (alignment: .lastTextBaseline, spacing: 12) {
                                Link(project.title, destination: URL(string: "https://modrinth.com/mod/\(id)")!)
                                    .font(.largeTitle)
                                    .foregroundColor(.primary)
                                TeamView(id: project.team)
                                Spacer()
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 16)
                        }
                        .background(EffectView(material: .sheet))
                    }
                }
            }
        }
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
