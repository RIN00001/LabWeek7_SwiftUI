//
//  AppSection.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI

enum AppSection: String, CaseIterable, Identifiable {
    case status
    case shop
    case about

    var id: String { rawValue }

    var title: String {
        switch self {
        case .status: return "Status"
        case .shop: return "Shop"
        case .about: return "About"
        }
    }

    var navigationTitle: String {
        switch self {
        case .status: return "Dashboard"
        case .shop: return "Shop"
        case .about: return "About"
        }
    }

    var systemImage: String {
        switch self {
        case .status: return "heart.fill"
        case .shop: return "cart.fill"
        case .about: return "info.circle.fill"
        }
    }
}
