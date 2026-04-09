//
//  AboutView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(.blue)

                Text("RIN Pet Simulator")
                    .font(.title2.bold())

                AboutInfoCard()

                Text("This application was built for Week 7 Mobile Application Development to demonstrate SwiftUI state management across iOS, iPadOS, and watchOS while following the Tamagotchi-style pet simulator requirements.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationTitle("About")
        .background(Color(.white))
    }
}
#endif
