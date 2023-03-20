//
//  Theme.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 16/03/23.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
//        switch self {
//        case .bubblegum:
//                return Color("Bubblegum")
//            case .buttercup:
//                return Color("Buttercup")
//            case .indigo:
//                return Color("Indigo")
//            case .lavender:
//                return Color("Lavender")
//            case .magenta:
//                return Color("Magenta")
//            case .navy:
//                return Color("Navy")
//            case .orange:
//            return .orange
//            case .oxblood:
//                return Color("Oxblood")
//            case .periwinkle:
//                return Color("Periwinkle")
//            case .poppy:
//                return Color("Poppy")
//            case .purple:
//                return Color("Purple")
//            case .seafoam:
//                return Color("Seafoam")
//            case .sky:
//                return Color("Sky")
//            case .tan:
//                return Color("Tan")
//            case .teal:
//                return Color("Teal")
//            case .yellow:
//            return .yellow
//            }
    }
    
    var name: String {
        rawValue.capitalized
    }
}

