//
//  IPhoneRootView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct IPhoneRootView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Status", systemImage: "heart.fill")
            }

            NavigationStack {
                ShopView()
            }
            .tabItem {
                Label("Shop", systemImage: "cart.fill")
            }

            NavigationStack {
                AboutView()
            }
            .tabItem {
                Label("About", systemImage: "info.circle.fill")
            }
        }
    }
}
#endif
