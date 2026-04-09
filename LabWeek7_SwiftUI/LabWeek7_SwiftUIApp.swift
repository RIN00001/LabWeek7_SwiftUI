//
//  LabWeek7_SwiftUIApp.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI

@main
struct LabWeek7_SwiftUIApp: App {
    @StateObject private var petViewModel = PetViewModel(
        petName: "RIN",
        petImageName: "Default_RIN"
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(petViewModel)
        }
    }
}
