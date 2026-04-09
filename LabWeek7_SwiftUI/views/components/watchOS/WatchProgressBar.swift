//
//  WatchProgressBar.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(watchOS)
import SwiftUI

struct WatchProgressBar: View {
    let progress: Double
    let tint: Color

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.white.opacity(0.12))

                Capsule()
                    .fill(tint)
                    .frame(width: max(8, geometry.size.width * min(max(progress, 0), 1)))
            }
        }
        .frame(height: 8)
    }
}
#endif
