//
//  HomeStatCard.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct HomeStatCard: View {
    let title: String
    let valueText: String
    let progress: Double
    let tint: Color
    let buttonTitle: String
    let isButtonDisabled: Bool
    let action: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.subheadline.bold())

                Spacer()

                Text(valueText)
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                    .animation(.easeInOut(duration: 0.3), value: valueText)
            }

            ProgressView(value: progress)
                .tint(tint)
                .scaleEffect(y: 1.5)
                .animation(.easeInOut(duration: 0.3),value: progress)

            Button(action: action) {
                Text(buttonTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(tint)
            .disabled(isButtonDisabled)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
#endif
