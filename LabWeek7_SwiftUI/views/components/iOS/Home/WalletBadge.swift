//
//  WalletBadge.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct WalletBadge: View {
    let amount: Int

    var body: some View {
        Text("Wallet: $\(amount)")
            .font(.headline.bold())
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(Color.yellow.opacity(0.25))
            .clipShape(Capsule())
    }
}
#endif
