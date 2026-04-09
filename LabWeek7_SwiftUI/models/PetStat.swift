//
//  PetStat.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import Foundation

struct PetStat {
    let type: PetStatType
    var current: Int
    var maximum: Int

    var progress: Double {
        guard maximum > 0 else { return 0 }
        return min(max(Double(current) / Double(maximum), 0), 1)
    }

    var percentage: Int {
        Int(progress * 100)
    }

    var valueText: String {
        "\(current) / \(maximum)"
    }
}
