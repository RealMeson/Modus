//
//  ModrinthGalleryView.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-10.
//

import SwiftUI
import NukeUI

struct ModrinthGalleryView: View {
    @State var gallery: [ModrinthImage]

    let columns = [GridItem(.adaptive(minimum: 80))]

    var body: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 200, maximum: .infinity), spacing: 24)], spacing: 24) {
            ForEach(gallery, id: \.self) { image in
                GeometryReader { geo in
                    LazyImage(url: image.url) { state in
                        if let image = state.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: 150)
                                .clipped()
                        }
                    }
                }
                .frame(height: 150)
            }
        }
        .animation(.linear)
    }
}

struct ModrinthGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ModrinthGalleryView(gallery: [])
    }
}
