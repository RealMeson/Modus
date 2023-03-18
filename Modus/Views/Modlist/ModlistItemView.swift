//
//  ModlistItemView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI
import NukeUI

struct ModlistModView: View {
    var title: String
    var icon = IconModel(type: .system, source: "circle")
    @State var toggle = false

    var body: some View {
        HStack(alignment: .center) {
            if (icon.type == .url) {
                LazyImage(url: URL(string: icon.source))
                    .processors([.resize(width: 16)])
                    .frame(width: 16, height: 16)
                    .clipShape(RoundedRectangle(cornerRadius: 2.0, style: .continuous))
            } else {
                Image(systemName: icon.source)
            }

            HStack(alignment: .lastTextBaseline) {
                Text("\(title)")
                    .font(.headline)
            }
            .lineLimit(1)
            Spacer()
            //Toggle("", isOn: $toggle)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .buttonStyle(.plain)
    }
}

struct ModlistModView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModlistModView(title: "Mod Title", icon: IconModel(type: .url, source: "https://cdn.modrinth.com/data/AANobbMI/icon.png"))
        }
    }
}
