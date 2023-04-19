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
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 200, maximum: .infinity))], alignment: .center, spacing: 12) {
                ForEach(gallery, id: \.self) { image in
                    ForEach(gallery, id: \.self) { image in
                        LazyImage(url: image.url) { state in
                            if let image = state.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ModrinthGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ModrinthGalleryView(gallery: [])
    }
}
