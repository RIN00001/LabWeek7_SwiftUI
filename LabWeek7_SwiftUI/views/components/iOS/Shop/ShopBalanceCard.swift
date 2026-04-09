//
//  ShopBalanceCard.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct ShopBalanceCard: View {
    let amount: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Current Balance")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("$\(amount)")
                    .font(.title2.bold())
            }

            Spacer()

            Image(systemName: "banknote.fill")
                .font(.title2)
                .foregroundStyle(.green)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.green.opacity(0.08))
        )
    }
}
#endif
