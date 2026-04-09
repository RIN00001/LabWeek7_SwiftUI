//
//  WatchStatusView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(watchOS)
import SwiftUI

struct WatchStatusView: View {
    @EnvironmentObject private var viewModel: PetViewModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Status")
                .font(.headline)
                .foregroundStyle(.secondary)

            ForEach(PetStatType.allCases) { type in
                let stat = viewModel.stat(for: type)

                WatchStatusRow(
                    title: type.shortTitle,
                    percentageText: "\(stat.percentage)%",
                    tint: type.color
                )
            }

            if viewModel.isDead {
                Text("Dead")
                    .font(.caption2.bold())
                    .foregroundStyle(.red)
                    .padding(.top, 4)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
    }
}
#endif
