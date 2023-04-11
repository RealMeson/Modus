//
//  SidebarView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-07.
//

import SwiftUI

private struct SidebarIcon: Identifiable, Equatable
{
    let imageName: String
    let title: String
    var id: Int
    var disabled: Bool = false
    var isCustom: Bool = false
    var usesFill: Bool = false
}

struct SidebarView: View {
    @Binding var selection: Int
    
    @State private var icons = [
        SidebarIcon(imageName: "folder", title: "Categories", id: 0, usesFill: true),
        SidebarIcon(imageName: "exclamationmark.triangle", title: "Alerts", id: 1, usesFill: true),
        SidebarIcon(imageName: "wrench.and.screwdriver", title: "Tools", id: 2, usesFill: true)
    ]

    var body: some View {
        VStack {
            HStack {
                ForEach(icons) { icon in
                    Button(action: {
                        selection = icon.id
                    }) {
                        let iconName = selection == icon.id && icon.usesFill ? "\(icon.imageName).fill" : icon.imageName
                        icon.isCustom ? Image(iconName) : Image(systemName: iconName)
                    }.help(icon.title)
                }
            }
                .buttonStyle(.plain)
            switch selection {
            case 0:
                Text("Installed Mods")
            case 1:
                Text("Errors")
            default:
                Spacer()
            }
            Spacer()
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SidebarView(selection: .constant(0))
            SidebarView(selection: .constant(1))
            SidebarView(selection: .constant(2))
        }
    }
}
