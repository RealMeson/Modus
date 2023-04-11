//
//  TeamView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-05.
//

import SwiftUI

struct TeamView: View {
    let id: String
    
    @EnvironmentObject var teamState: ModrinthTeamState

    var body: some View {
        HStack {
            if let team = teamState.team {
                ForEach(team, id: \.user.id) { member in
                    Text(member.user.username)
                }
            }
        }
        .task(id: id) {
            teamState.team = nil
            try? await teamState.getTeam(id: id)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(id: "O9wOHL2n")
            .environmentObject(ModrinthTeamState())
    }
}
