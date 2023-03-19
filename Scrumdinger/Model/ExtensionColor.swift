//
//  ExtensionColor.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 19/03/23.
//

import SwiftUI

extension Color {
    static func fromString ( _ string: String) -> Color {
        if let color = UIColor(named: string) {
            return Color(color)
        }
        
        return Color.clear
    }
}
