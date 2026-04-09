//
//  PetAction.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI

enum PetAction: String, CaseIterable, Identifiable {
    case play
    case clean
    case feed
    case rest

    var id: String { rawValue }

    var title: String {
        switch self {
        case .play: return "Play"
        case .clean: return "Clean"
        case .feed: return "Feed"
        case .rest: return "Rest"
        }
    }

    var statType: PetStatType {
        switch self {
        case .play: return .fun
        case .clean: return .cleanliness
        case .feed: return .hunger
        case .rest: return .energy
        }
    }

    var tint: Color {
        statType.color
    }

    var systemImage: String {
        statType.systemImage
    }
}
