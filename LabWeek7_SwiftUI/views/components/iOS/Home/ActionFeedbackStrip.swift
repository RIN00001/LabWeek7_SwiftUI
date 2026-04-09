//
//  ActionFeedbackStrip.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct ActionFeedbackStrip: View {
    let message: String
    let items: [ActionFeedbackItem]

    var body: some View {
        VStack(spacing: 10) {
            Text(message)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(items) { item in
                        Text(item.text)
                            .font(.caption.bold())
                            .foregroundStyle(item.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(item.color.opacity(0.12))
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 2)
            }
        }
    }
}
#endif
