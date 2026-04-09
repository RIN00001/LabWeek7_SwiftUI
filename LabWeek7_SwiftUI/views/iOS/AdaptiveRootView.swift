//
//  AdaptiveRootView.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

#if os(iOS)
import SwiftUI

struct AdaptiveRootView: View {
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            IPadRootView()
        } else {
            IPhoneRootView()
        }
    }
}
#endif
