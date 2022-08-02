//
//  Theme.swift
//  Due
//
//  Created by Josef Wengler on 17.07.22.
//

import SwiftUI

enum Theme: String {
    case orange
    case red
    case blue
    case lightblue
    case yellow
    case pink
    case green

    var accentColor: Color {
        switch self {
        case .yellow, .orange, .red, .lightblue, .pink, .green, .blue: return .black
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
}
