//
//  StickyHeaderView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-20.
//

import SwiftUI

struct StickyHeader<Content: View>: View {

    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            if(geo.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .clipped()
            } else {
                content
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
                    .clipped()
                    .offset(y: -geo.frame(in: .global).minY)
            }
        }.frame(minHeight: minHeight)
    }
}
