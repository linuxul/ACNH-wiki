//
//  Category.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/06/08.
//

import Foundation

enum Category: String, CaseIterable {
    case fishes = "Fishes"
    case seaCreatures = "Sea Creatures"
    case bugs = "Bugs"
    case fossils = "Fossils"
    case art = "Art"
    case housewares = "Housewares"
    
    var iconName: String {
        switch self {
        case .bugs: return "Ins13"
        case .fishes: return "Fish6"
        case .seaCreatures: return "div25"
        case .fossils: return "icon-fossil"
        case .art: return "icon-board"
        case .housewares: return "icon-housewares"
            
        }
    }

    var progressIconName: String {
        switch self {
        case .bugs: return "Ins1"
        case .fishes: return "Fish6"
        case .seaCreatures: return "div11"
        case .fossils: return "icon-fossil"
        case .art: return "icon-board"
        case .housewares: return "icon-housewares"
        }
    }
    
    static func items() -> [Category] {
        [.fishes, .seaCreatures, .bugs, .fossils, .art, .housewares]
    }
    
    static func progress() -> [Category] {
        [.fishes, .bugs, .seaCreatures, .fossils, .art]
    }
    
    static var critters: [Category] {
        [.fishes, .seaCreatures, .bugs]
    }
}
