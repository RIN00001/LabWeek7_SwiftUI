//
//  IPadRootView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI
import Foundation
import Combine

struct IPadRootView: View {
    @EnvironmentObject private var viewModel: PetViewModel
    @State private var columnVisibility: NavigationSplitViewVisibility = .all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(AppSection.allCases, selection: $viewModel.selectedSection) {
                section in
                Label(section.title, systemImage: section.systemImage)
                    .tag(section)
            }
            .navigationTitle("Tamagotchi")
        } detail: {
            switch viewModel.selectedSection ?? .status {
            case .status:
                HomeView()
            case .shop:
                ShopView()
            case .about:
                AboutView()
            }        }
        .navigationSplitViewStyle(.balanced)
    }
}
#endif
