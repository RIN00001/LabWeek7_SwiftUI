//
//  WatchStatusRow.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(watchOS)
import SwiftUI

struct WatchStatusRow: View {
    let title: String
    let percentageText: String
    let tint: Color

    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)

            Spacer()

            Text(percentageText)
                .font(.footnote.bold())
                .foregroundStyle(tint)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
#endif
