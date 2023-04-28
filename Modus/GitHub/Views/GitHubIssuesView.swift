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

    @EnvironmentObject var issuesState: GithubIssueListState

    var body: some View {
        VStack(spacing: 12) {
            if let issues = issuesState.issues {
                ForEach(issues, id: \.self) { issue in
                    GitHubIssueItemView(issue: issue)
                }
            } else {
                VStack(alignment: .center) {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task {
            try? await issuesState.getIssuesFromRepository(owner: owner, name: name)
        }
    }
}

struct GitHubIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubIssuesView(owner: "IrisShaders", name: "Iris")
            .environmentObject(GithubIssueListState())
    }
}
