//
//  ModrinthCategoryType.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-04.
//

import Foundation

enum ModrinthCategoryType: String, CaseIterable, Decodable {
    // Resource Packs
    case x8 = "8x-"
    case x16 = "16x"
    case x32 = "32x"
    case x48 = "48x"
    case x64 = "64x"
    case x128 = "128x"
    case x256 = "256x"
    case x512 = "512x+"
    case audio = "audio"
    case blocks = "blocks"
    case entities = "entities"
    case enironment = "environment"
    case fonts = "fonts"
    case gui = "gui"
    case items = "items"
    case locale = "locale"
    case modded = "modded"
    case models = "models"
    case realistic = "realistic"
    case simplistic = "simplistic"
    case themed = "themed"
    case tweaks = "tweaks"
    
    // Shaders
    case atmosphere = "atmosphere"
    case bloom = "blom"
    case cartoon = "cartoon"
    case coloredLighting = "colored-lighting"
    case coreShaders = "core-shaders"
    case fantasy = "fantasy"
    case foliage = "foliage"
    case high = "high"
    case low = "low"
    case medium = "medium"
    case pathTracing = "path-tracing"
    case pbr = "pbr"
    case potato = "potato"
    case reflections = "reflections"
    case screenshot = "screenshot"
    case semiRealistic = "semi-realistic"
    case shadows = "shadows"
    case vanillaLike = "vanilla-like"
    
    // Modpacks
    case challenging = "challenging"
    case combat = "combat"
    case kitchenSink = "kitchen-sink"
    case lightweight = "lightweight"
    case multiplayer = "multiplayer"
    case quests = "quests"
    
    case adventure = "adventure"
    case cursed = "cursed"
    case decoration = "decoration"
    case economy = "economy"
    case equipment = "equipment"
    case food = "food"
    case gameMechanics = "game-mechanics"
    case library = "library"
    case magic = "magic"
    case management = "management"
    case minigame = "minigame"
    case mobs = "mobs"
    case optimization = "optimization"
    case social = "social"
    case storage = "storage"
    case technology = "technology"
    case transportation = "transportation"
    case utility = "utility"
    case worldGeneration = "worldgen"
}
