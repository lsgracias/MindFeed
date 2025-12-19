//
//  Theme.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct AppTheme {
    static let primary = Color(hex: "195de6")
    static let accent = Color(hex: "4ECDC4")
    static let backgroundLight = Color(hex: "f6f6f8")
    static let backgroundDark = Color(hex: "111621")
    static let textLight = Color(hex: "333333")
    static let textDark = Color(hex: "E0E0E0")
    static let textSecondaryLight = Color(hex: "888888")
    static let textSecondaryDark = Color(hex: "A0A0A0")
    static let surfaceLight = Color.white
    static let surfaceDark = Color(hex: "1E242F")
    static let borderLight = Color(hex: "EAEAEA")
    static let borderDark = Color(hex: "2E3645")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

