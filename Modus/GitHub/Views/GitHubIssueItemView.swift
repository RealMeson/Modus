//
//  GitHubIssueItemView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-19.
//

import SwiftUI
import NukeUI

struct GitHubIssueItemView: View {
    var issue: GitHubIssueItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                Label("Status", systemImage: issue.state.icon)
                    .frame(width: 16, height: 16)
                HStack(alignment: .lastTextBaseline) {
                    Text("\(issue.title)")
                        .font(.headline)
                        .lineLimit(1)
                    Text("(#\(issue.number))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Label("Comments", systemImage: "bubble.right")
                Text("\(issue.totalComments)")
            }
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    /*
                    LazyImage(url: authorAvatarUrl)
                        .processors([.resize(width: 16)])
                        .frame(width: 16, height: 16)
                     */
                    Label("Author", systemImage: "person.circle")
                        .frame(width: 16, height: 16)
                    Text("\(issue.authorUsername)")
                }
                if (!issue.labels.isEmpty) {
                    HStack(spacing: 4) {
                        Label("Labels", systemImage: "tag")
                        HStack(spacing: 0) {
                            ForEach(Array(issue.labels.enumerated()), id: \.offset) { index, label in
                                Text(label.name)
                                if index != issue.labels.count - 1 {
                                    Text(", ")
                                }
                            }
                        }
                    }
                }
                Spacer()
                HStack(spacing: 4) {
                    Label("Created", systemImage: "clock")
                    Text(relativeDate)
                }
            }
            .foregroundColor(.gray)
            .font(.subheadline)
        }
        .labelStyle(.iconOnly)
    }
    
    var relativeDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: issue.updated, relativeTo: Date())
    }
}

struct GitHubIssueItemView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubIssueItemView(issue: GitHubIssueItem(
            id: "id",
            title: "Issue title",
            number: 54,
            updated: Date().addingTimeInterval(-15000),
            state: .open,
            labels: [
                GitHubLabelModel(name: "bug", description: "it's a bug", colour: .red),
                GitHubLabelModel(name: "crash", description: "it's a crash", colour: .red)
            ],
            authorUsername: "Author",
            authorAvatarUrl: URL(string: "https://avatars.githubusercontent.com/u/77991691?u=35c9f848d331019901d7bf23196db12b80701771&v=4")!,
            totalComments: 4
        ))
    }
}
