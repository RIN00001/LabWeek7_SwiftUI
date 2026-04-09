//
//  WatchActionPage.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(watchOS)
import SwiftUI

struct WatchActionPage: View {
    @EnvironmentObject private var viewModel: PetViewModel
    let action: PetAction

    var body: some View {
        let stat = viewModel.stat(for: action.statType)

        VStack(spacing: 10) {
            Image(systemName: action.systemImage)
                .font(.title2)
                .foregroundStyle(action.tint)

            Text(action.statType.title)
                .font(.headline)

            WatchProgressBar(
                progress: stat.progress,
                tint: action.tint
            )

            Text("\(stat.percentage)%")
                .font(.caption2)
                .foregroundStyle(.secondary)

            Button(action.title) {
                viewModel.perform(action)
            }
            .tint(action.tint)
            .disabled(viewModel.isActionDisabled(action))

            if action == .feed {
                Text("Wallet: $\(viewModel.money)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            if viewModel.isDead {
                Text("RIN is dead")
                    .font(.caption2)
                    .foregroundStyle(.red)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
    }
}
#endif
