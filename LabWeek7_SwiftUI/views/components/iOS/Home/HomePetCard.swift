//
//  HomePetCard.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//


import SwiftUI

struct HomePetCard: View {
    let petName: String
    let imageName: String
    let isDead: Bool

    var body: some View {
        VStack(spacing: 14) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .saturation(isDead ? 0 : 1)
                    .opacity(isDead ? 0.85 : 1)

                if isDead {
                    VStack(spacing: 8) {
                        Text("\(petName) has died.")
                            .font(.headline.bold())
                            .foregroundStyle(.white)

                        Text("Revive using all your money")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .padding()
                    .background(.black.opacity(0.45))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }

            Text(petName)
                .font(.title2.bold())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

