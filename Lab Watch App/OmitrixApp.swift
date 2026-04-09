//
//  OmitrixApp.swift
//  Omitrix Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

@main
struct OmitrixApp: App {
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

