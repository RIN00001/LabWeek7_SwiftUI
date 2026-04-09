//
//  ShopView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var viewModel: PetViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                ShopBalanceCard(amount: viewModel.money)

                Text("UPGRADES")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)

                VStack(spacing: 12) {
                    ForEach(PetStatType.allCases) { type in
                        ShopUpgradeCard(
                            type: type,
                            currentMax: viewModel.currentMax(for: type),
                            cost: 50,
                            isDisabled: !viewModel.canAffordUpgrade(for: type)
                        ) {
                            viewModel.purchaseUpgrade(for: type)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Shop")
        .background(Color(.systemGroupedBackground))
    }
}
#endif
