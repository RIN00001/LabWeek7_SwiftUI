//
//  HomeView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: PetViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]

    private let orderedActions: [PetAction] = [
        .feed, .clean, .play, .rest
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HomePetCard(
                    petName: viewModel.petName,
                    imageName: viewModel.petImageName,
                    isDead: viewModel.isDead
                )

                if viewModel.isDead {
                    Button {
                        viewModel.revive()
                    } label: {
                        Text("Revive")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(viewModel.money == 0)
                }

                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(orderedActions) { action in
                        let stat = viewModel.stat(for: action.statType)

                        HomeStatCard(
                            title: action.statType.title,
                            valueText: stat.valueText,
                            progress: stat.progress,
                            tint: action.tint,
                            buttonTitle: action.title,
                            isButtonDisabled: viewModel.isActionDisabled(action)
                        ) {
                            viewModel.perform(action)
                        }
                    }
                }

                WalletBadge(amount: viewModel.money)

                ActionFeedbackStrip(
                    message: viewModel.statusMessage,
                    items: viewModel.feedbackItems
                )
            }
            .padding()
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
}
#endif
