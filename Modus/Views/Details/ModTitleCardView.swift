//
//  ModTitleCardView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-02-09.
//

import SwiftUI
import NukeUI

struct ModTitleCardView: View {
    private let imageSize: CGFloat = 250
    var title: String
    var authors: [String]
    var categories: [ModrinthCategoryType]
    var image: URL?

    var body: some View {
        ZStack (alignment: .bottomLeading) {
            if (image != nil) {
                LazyImage(url: image) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: imageSize)
                            .overlay(
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)))
                    }
                }
            } else {
                Rectangle()
                    .fill(.clear)
                    .frame(height: imageSize)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)))
            }
            HStack (alignment: .lastTextBaseline, spacing: 12) {
                Text("\(title)")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("by Author")
                Spacer()
                categoryIcons
            }
            .foregroundColor(.white)
            .padding(24)
        }
        .frame(height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
    
    var categoryIcons: some View {
        HStack {
            ForEach(categories, id: \.rawValue) {category in
                switch category {
                case .adventure:
                    Image(systemName: "safari")
                case .cursed:
                    Image(systemName: "ant")
                case .decoration:
                    Image(systemName: "house")
                case .economy:
                    Image(systemName: "dollarsign")
                case .equipment:
                    Image(systemName: "tshirt")
                case .food:
                    Image(systemName: "carrot")
                case .gameMechanics:
                    Image(systemName: "slider.vertical.3")
                case .library:
                    Image(systemName: "book.closed")
                case .magic:
                    Image(systemName: "wand.and.stars")
                case .management:
                    Image(systemName: "server.rack")
                case .minigame:
                    Image(systemName: "flag.checkered")
                case .mobs:
                    Image(systemName: "figure.stand")
                case .optimization:
                    Image(systemName: "bolt")
                case .social:
                    Image(systemName: "bubble.right")
                case .storage:
                    Image(systemName: "archivebox")
                case .technology:
                    Image(systemName: "externaldrive")
                case .transportation:
                    Image(systemName: "box.truck")
                case .utility:
                    Image(systemName: "briefcase")
                case .worldGeneration:
                    Image(systemName: "globe.americas")
                default:
                    Image(systemName: "circle")
                }
            }
        }
    }
}

struct ModTitleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ModTitleCardView(title: "Simple Voice Chat", authors: [], categories: [.utility, .worldGeneration], image: URL(string: "https://cdn.modrinth.com/data/9eGKb6K1/images/975131df603729941d6549a8e78fed1509bf0518.png"))
    }
}
