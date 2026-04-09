//
//  ContentView.swift
//  Omitrix Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WatchPagerView()
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
