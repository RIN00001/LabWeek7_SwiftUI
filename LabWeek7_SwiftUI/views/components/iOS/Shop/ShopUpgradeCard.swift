//
//  ShopUpgradeCard.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct ShopUpgradeCard: View {
    let type: PetStatType
    let currentMax: Int
    let cost: Int
    let isDisabled: Bool
    let action: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(type.color.opacity(0.15))
                    .frame(width: 42, height: 42)

                Image(systemName: type.systemImage)
                    .foregroundStyle(type.color)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Max \(type.title) [Current Max: \(currentMax)]")
                    .font(.subheadline.bold())

                Text("Increase max limit by 20")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: action) {
                Text("BUY $\(cost)")
                    .font(.caption.bold())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(isDisabled)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
#endif
