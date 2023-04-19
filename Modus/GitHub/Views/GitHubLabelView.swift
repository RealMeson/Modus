//
//  GitHubLabelView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-18.
//

import SwiftUI

struct GitHubLabelView: View {
    let label: GitHubLabelModel
    
    var body: some View {
        Text(label.name)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .foregroundColor(Color(rgba: label.textColour))
            .background(Color(rgba: label.colour), in: Capsule())
    }
}

struct GitHubLabelView_Previews: PreviewProvider {
    static var previews: some View {
        let black = UInt32("FF", radix: 16)!
        let colour = (UInt32("d73a4a", radix: 16)! << 8) | black
        let r = colour >> 24
        let g = (colour >> 16) & black
        let b = (colour >> 8) & black
        let lum = 0.2126 * Float(r) + 0.7152 * Float(g) + 0.0722 * Float(b)
        let text = lum < 0.50 ? black : UInt32("FFFFFFFF", radix: 16)!
        GitHubLabelView(label: GitHubLabelModel(name: "bug", description: "it's a bug", colour: colour, textColour: text))
    }
}
