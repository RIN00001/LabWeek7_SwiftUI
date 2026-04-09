//
//  AboutInfoCard.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct AboutInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: Rifki Indra Nugroho")
            Text("NIM: 0706012410033")
            Text("Class: Mobile App Development Class A")
            Text("Week: 7")
            Text("Learning: SwiftUI watchOS and iPadOS navigation")
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
#endif
