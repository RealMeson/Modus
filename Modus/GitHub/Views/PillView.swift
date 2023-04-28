//
//  GitHubLabelView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-18.
//

import SwiftUI

struct PillView: View {
    let text: String
    let colour: Color
    let rgba: UInt32
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(colour, in: Capsule())
            .foregroundColor(.white)
    }
    
    func getTextColour(rgba: UInt32) -> Bool {
        let black = UInt32("FF", radix: 16)!
        let r = rgba >> 24
        let g = (rgba >> 16) & black
        let b = (rgba >> 8) & black
        let lum = 0.2126 * Float(r) + 0.7152 * Float(g) + 0.0722 * Float(b)
        return lum < 0.50
    }
}

struct Pill_Previews: PreviewProvider {
    static var previews: some View {
        PillView(text: "bug", colour: .red, rgba: 0)
    }
}
