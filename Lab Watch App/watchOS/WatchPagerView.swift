//
//  WatchPagerView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(watchOS)
import SwiftUI

struct WatchPagerView: View {
    var body: some View {
        TabView {
            WatchStatusView()
            WatchActionPage(action: .rest)
            WatchActionPage(action: .play)
            WatchActionPage(action: .clean)
            WatchActionPage(action: .feed)
        }
        .tabViewStyle(.verticalPage)
    }
}
#endif
