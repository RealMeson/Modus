//
//  LoaderType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-04.
//

import Foundation

enum LoaderType: String, CaseIterable, Identifiable {
    case bukkit, bungeecord, canvas, datapack, fabric, forge, iris, liteloader, minecraft, modloader, optifine, paper, purpur, quilt, rift, spigot, sponge, vanilla, velocity, waterfall
    var id: Self { self }
}

extension LoaderType {
    var icon: String {
        switch self.id {
        case .fabric:
            return "rectangle"
        case .forge:
            return "hammer"
        case .liteloader:
            return "bird"
        case .modloader:
            return "m.square"
        case .quilt:
            return "square.grid.2x2"
        case .rift:
            return "cube"

        case .bukkit:
            return "xmark.bin"
        case .paper:
            return "paperplane"
        case .purpur:
            return "cube.transparent"
        case .spigot:
            return "spigot"
        case .sponge:
            return "bathtub"
        case .bungeecord:
            return "alternatingcurrent"
        case .velocity:
            return "tropicalstorm"
        case .waterfall:
            return "drop"
            
        case .canvas:
            return "square.stack.3d.up"
        case .iris:
            return "camera.aperture"
        case .optifine:
            return "o.circle"
        case .vanilla:
            return "shippingbox"
        default:
            return "circle"
        }
    }
}

extension LoaderType {
    var label: String {
        switch self.id {
        case .fabric:
            return "Fabric"
        case .forge:
            return "Forge"
        case .liteloader:
            return "LiteLoader"
        case .modloader:
            return "Risugami's ModLoader"
        case .quilt:
            return "Quilt"
        case .rift:
            return "Rift"

        case .bukkit:
            return "Bukkit"
        case .paper:
            return "Paper"
        case .purpur:
            return "Purpur"
        case .spigot:
            return "Spigot"
        case .sponge:
            return "Sponge"
        case .bungeecord:
            return "BungeeCord"
        case .velocity:
            return "Velocity"
        case .waterfall:
            return "Waterfall"
            
        case .canvas:
            return "Canvas"
        case .iris:
            return "Iris"
        case .optifine:
            return "Optifine"
        case .vanilla:
            return "Vanilla"
        default:
            return "default"
        }
    }
}
