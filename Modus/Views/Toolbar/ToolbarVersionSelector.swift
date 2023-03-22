//
//  ToolbarVersionSelector.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-21.
//

import SwiftUI

struct ToolbarVersionSelector: View {
    @EnvironmentObject var modDetails: ModDetailsState

    var body: some View {
        Menu {
        } label: {
            Text("Versions")
        }
    }
}

struct ToolbarVersionSelector_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarVersionSelector()
    }
}
