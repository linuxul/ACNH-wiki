//
//  HousewaresResponseDTO.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/07/14.
//

import Foundation

struct HousewaresResponseDTO: Codable, APIResponse {

    let name: String
    let image: String?
    let variation: String?
    let bodyTitle: String?
    let pattern: String?
    let patternTitle: String?
    let diy: Bool
    let bodyCustomize: Bool
    let patternCustomize: Bool
    let kitCost: Int?
    let kitType: String?
    let cyrusCustomizePrice: String?
    let buy: Int
    let sell: Int
    let size: Size
    let surface: Bool?
    let exchangePrice: Int?
    let exchangeCurrency: ExchangeCurrency?
    let source: [Source]
    let sourceNotes: [String]?
    let seasonEvent: String?
    let seasonEventExclusive: Bool?
    let hhaBasePoints: Int
    let hhaCategory: HhaCategory?
    let interact: InteractUnion
    let tag: String
    let outdoor: Bool
    let speakerType: String?
    let lightingType: LightingType?
    let catalog: Catalog?
    let versionAdded: String
    let unlocked: Bool
    let filename: String?
    let variantId: String?
    let internalId: Int?
    let uniqueEntryId: String?
    let translations: Translations
    let colors: [Color]?
    let concepts: [Concept]?
    let set: String?
    let series: String?
    let recipe: Recipe?
    let seriesTranslations: Translations?
    let variations: [Variant]?

}

struct FurnitureTranslations: Codable {
    let id: Int
    let eUde, eUen, eUit, eUnl: String
    let eUru, eUfr, eUes, uSen: String
    let uSfr, uSes, jPja, kRko: String
    let tWzh, cNzh: String
    
    enum LanguageCode: String {
        case de, en, it, nl, ru, fr, es, ja, ko, zh
    }
    
    func localizedName() -> String {
        guard let code = Locale.current.languageCode, let languageCode = LanguageCode(rawValue: code) else {
            return uSen
        }
        switch languageCode {
        case .de: return eUde
        case .en: return uSen
        case .it: return eUit
        case .nl: return eUnl
        case .ru: return eUru
        case .fr: return eUfr
        case .es: return eUes
        case .ja: return jPja
        case .ko: return kRko
        case .zh: return cNzh
        }
    }
}

enum Catalog: String, Codable {
    case forSale = "For sale"
    case notForSale = "Not for sale"
    case seasonal = "Seasonal"
}

enum ExchangeCurrency: String, Codable {
    case heartCrystals = "Heart Crystals"
    case nookMiles = "Nook Miles"
    case poki = "Poki"
}

enum HhaCategory: String, Codable {
    case ac = "AC"
    case appliance = "Appliance"
    case audio = "Audio"
    case clock = "Clock"
    case doll = "Doll"
    case dresser = "Dresser"
    case kitchen = "Kitchen"
    case lighting = "Lighting"
    case musicalInstrument = "MusicalInstrument"
    case pet = "Pet"
    case plant = "Plant"
    case smallGoods = "SmallGoods"
    case trash = "Trash"
    case tv = "TV"
}

enum InteractUnion: Codable {
    case bool(Bool)
    case enumeration(InteractEnum)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let element = try? container.decode(Bool.self) {
            self = .bool(element)
            return
        }
        if let element = try? container.decode(InteractEnum.self) {
            self = .enumeration(element)
            return
        }
        throw DecodingError.typeMismatch(
            InteractUnion.self,
            DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for InteractUnion")
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let element):
            try container.encode(element)
        case .enumeration(let element):
            try container.encode(element)
        }
    }
}

enum InteractEnum: String, Codable {
    case bed = "Bed"
    case chair = "Chair"
    case kitchenware = "Kitchenware"
    case mirror = "Mirror"
    case musicPlayer = "Music Player"
    case musicalInstrument = "Musical Instrument"
    case storage = "Storage"
    case toilet = "Toilet"
    case trash = "Trash"
    case tv = "TV"
    case wardrobe = "Wardrobe"
    case workbench = "Workbench"
}

// MARK: - Recipe
struct Recipe: Codable {
    let name: String
    let image: String
    let imageSh: String?
    let buy: Int
    let sell: Int?
    let exchangePrice: Int?
    let exchangeCurrency: ExchangeCurrency?
    let source: [String]
    let sourceNotes: [String]?
    let seasonEvent: String?
    let seasonEventExclusive: Bool?
    let versionAdded: String
    let unlocked: Bool
    let recipesToUnlock: Int
    let category: String
    let craftedItemInternalId: Int
    let cardColor: CardColor
    let diyIconFilename: String
    let diyIconFilenameSh: String?
    let serialId: Int
    let internalId: Int
    let materials: [String: Int]
    let materialsTranslations: [String: Translations?]
}

enum CardColor: String, Codable {
    case blue = "blue"
    case brick = "brick"
    case brown = "brown"
    case color56 = "color_56"
    case cream = "cream"
    case darkGray = "dark gray"
    case gold = "gold"
    case green = "green"
    case lightGray = "light gray"
    case orange = "orange"
    case pink = "pink"
    case purple = "purple"
    case red = "red"
    case silver = "silver"
    case white = "white"
    case yellow = "yellow"
}

enum Source: String, Codable {
    case birthday = "Birthday"
    case brewster = "Brewster"
    case cJ = "C.J."
    case crafting = "Crafting"
    case cyrus = "Cyrus"
    case flick = "Flick"
    case franklin = "Franklin"
    case groupStretching = "Group Stretching"
    case gullivarrr = "Gullivarrr"
    case gulliver = "Gulliver"
    case hhpOffice = "HHP Office"
    case jack = "Jack"
    case jingle = "Jingle"
    case luna = "Luna"
    case nookMilesRedemption = "Nook Miles Redemption"
    case nookSCranny = "Nook's Cranny"
    case nookShoppingDailySelection = "Nook Shopping Daily Selection"
    case nookShoppingPromotion = "Nook Shopping Promotion"
    case nookShoppingSeasonal = "Nook Shopping Seasonal"
    case pavé = "Pavé"
    case recycleBox = "Recycle box"
    case startingItems = "Starting items"
    case wardell = "Wardell"
}

// MARK: - Variation
struct Variant: Codable {
    let image: String
    let variation: String?
    let pattern: String?
    let patternTitle: String?
    let kitType: Kit?
    let cyrusCustomizePrice: Int
    let surface: Bool
    let exchangePrice: Int?
    let exchangeCurrency: ExchangeCurrency?
    let seasonEvent: String?
    let seasonEventExclusive: Bool?
    let hhaCategory: HhaCategory?
    let filename: String
    let variantId: String
    let internalId: Int
    let variantTranslations: Translations?
    let colors: [Color]
    let concepts: [Concept]
    let patternTranslations: Translations?
    
    func toKeyword() -> [String] {
        return colors.map { $0.rawValue } + concepts.map { $0.rawValue }
    }
}

enum Kit: String, Codable {
    case normal = "Normal"
    case pumpkin = "Pumpkin"
    case rainbowFeather = "Rainbow feather"
}

extension HousewaresResponseDTO {
    func toDomain() -> Item {
        return Item(
            name: name,
            category: .housewares,
            image: image,
            variation: variation,
            bodyTitle: bodyTitle,
            pattern: pattern,
            patternTitle: patternTitle,
            diy: diy,
            bodyCustomize: bodyCustomize,
            patternCustomize: patternCustomize,
            buy: buy,
            sell: sell,
            size: size,
            exchangePrice: exchangePrice,
            exchangeCurrency: exchangeCurrency,
            sources: source,
            sourceNotes: sourceNotes,
            seasonEvent: seasonEvent,
            hhaCategory: hhaCategory,
            tag: tag,
            outdoor: outdoor,
            speakerType: speakerType,
            lightingType: lightingType,
            catalog: catalog,
            internalId: internalId,
            translations: translations,
            colors: colors,
            concepts: concepts,
            set: set,
            series: series,
            recipe: recipe,
            seriesTranslations: seriesTranslations,
            variations: variations
        )
    }
}
