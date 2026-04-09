//
//  ContentView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        AdaptiveRootView()
        #elseif os(watchOS)
        WatchPagerView()
        #else
        Text("Unsupported platform")
        #endif
    }
}

#Preview {
    ContentView()
        .environmentObject(
            PetViewModel(
                petName: "RIN",
                petImageName: "Default_RIN"
            )
        )
}
