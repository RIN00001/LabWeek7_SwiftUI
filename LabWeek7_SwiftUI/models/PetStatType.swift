//
//  PetStatType.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI

enum PetStatType: String, CaseIterable, Identifiable {
    case hunger
    case cleanliness
    case fun
    case energy

    var id: String { rawValue }

    var title: String {
        switch self {
        case .hunger: return "Hunger"
        case .cleanliness: return "Cleanliness"
        case .fun: return "Fun"
        case .energy: return "Energy"
        }
    }

    var shortTitle: String {
        switch self {
        case .cleanliness: return "Clean"
        default: return title
        }
    }

    var systemImage: String {
        switch self {
        case .hunger: return "fork.knife"
        case .cleanliness: return "sparkles"
        case .fun: return "figure.run"
        case .energy: return "moon.fill"
        }
    }

    var color: Color {
        switch self {
        case .hunger: return .orange
        case .cleanliness: return .blue
        case .fun: return .pink
        case .energy: return .purple
        }
    }
}
