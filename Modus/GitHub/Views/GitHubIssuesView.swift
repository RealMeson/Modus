//
//  GitHubIssuesView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-11.
//

import SwiftUI

struct GitHubIssuesView: View {
    let owner: String
    let name: String

    @StateObject var issuesState = GithubIssuesStore()

    var body: some View {
        VStack {
            if let issues = issuesState.issues {
                List {
                    ForEach(issues, id: \.self) { issue in
                        HStack {
                            Label("Status", systemImage: issue.state.icon)
                                .labelStyle(.iconOnly)
                            Text("\(issue.title)")
                                .font(.headline)
                            ForEach(issue.labels, id: \.name) { label in
                                GitHubLabelView(label: label)
                            }
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .frame(minWidth: 500, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        .task {
            try! await issuesState.getIssuesFromRepository(owner: owner, name: name)
        }
    }
}

struct GitHubIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubIssuesView(owner: "IrisShaders", name: "Iris")
    }
}
