//
//  PetViewModel.swift
//  LabWeek7_SwiftUI
//
//  Created by student on 09/04/26.
//

import SwiftUI
import Combine

final class PetViewModel: ObservableObject {
    @Published private(set) var stats: [PetStatType: PetStat]
    @Published private(set) var money: Int
    @Published private(set) var isDead = false
    @Published var selectedSection: AppSection? = .status
    @Published var feedbackItems: [ActionFeedbackItem] = []
    @Published var statusMessage: String = "Take good care of your pet."

    let petName: String
    let petImageName: String

    private let defaultMaxStat = 150
    private let initialCurrentStat = 115
    private let passiveDrainAmount = 5
    private let passiveDrainInterval: TimeInterval = 3
    private let actionPenaltyAmount = 10
    private let feedCost = 5
    private let upgradeCost = 50
    private let upgradeAmount = 20

    private var timerCancellable: AnyCancellable?

    init(petName: String, petImageName: String, startingMoney: Int = 100) {
        self.petName = petName
        self.petImageName = petImageName
        self.money = startingMoney

        var initialStats: [PetStatType: PetStat] = [:]
        for type in PetStatType.allCases {
            initialStats[type] = PetStat(
                type: type,
                current: initialCurrentStat,
                maximum: defaultMaxStat
            )
        }
        self.stats = initialStats

        startTimer()
    }

    deinit {
        stopTimer()
    }

    func stat(for type: PetStatType) -> PetStat {
        stats[type] ?? PetStat(type: type, current: 0, maximum: defaultMaxStat)
    }

    func isActionDisabled(_ action: PetAction) -> Bool {
        if isDead { return true }

        switch action {
        case .feed:
            return money < feedCost
        default:
            return false
        }
    }

    func canAffordUpgrade(for type: PetStatType) -> Bool {
        _ = type
        return money >= upgradeCost
    }

    func currentMax(for type: PetStatType) -> Int {
        stat(for: type).maximum
    }

    func perform(_ action: PetAction) {
        guard !isDead else { return }

        if action == .feed && money < feedCost {
            feedbackItems = [
                ActionFeedbackItem(text: "Not enough money", color: .red)
            ]
            statusMessage = "You need at least $\(feedCost) to feed \(petName)."
            return
        }

        var newFeedback: [ActionFeedbackItem] = []
        let gainAmount = Int.random(in: 20...40)

        switch action {
        case .play:
            increase(.fun, by: gainAmount)
            newFeedback.append(ActionFeedbackItem(text: "+\(gainAmount) Fun", color: .green))

            let moneyGain = Int.random(in: 20...30)
            money += moneyGain
            newFeedback.append(ActionFeedbackItem(text: "+$\(moneyGain) Wallet", color: .green))

            decrease(.energy, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Energy", color: .red))

            decrease(.cleanliness, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Cleanliness", color: .red))

            statusMessage = "\(petName) had fun and earned some money."

        case .clean:
            increase(.cleanliness, by: gainAmount)
            newFeedback.append(ActionFeedbackItem(text: "+\(gainAmount) Cleanliness", color: .green))

            decrease(.fun, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Fun", color: .red))

            decrease(.energy, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Energy", color: .red))

            statusMessage = "\(petName) is much cleaner now."

        case .feed:
            money -= feedCost
            newFeedback.append(ActionFeedbackItem(text: "-$\(feedCost) Wallet", color: .red))

            increase(.hunger, by: gainAmount)
            newFeedback.append(ActionFeedbackItem(text: "+\(gainAmount) Hunger", color: .green))

            decrease(.cleanliness, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Cleanliness", color: .red))

            statusMessage = "\(petName) has been fed."

        case .rest:
            increase(.energy, by: gainAmount)
            newFeedback.append(ActionFeedbackItem(text: "+\(gainAmount) Energy", color: .green))

            decrease(.fun, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Fun", color: .red))

            decrease(.hunger, by: actionPenaltyAmount)
            newFeedback.append(ActionFeedbackItem(text: "-\(actionPenaltyAmount) Hunger", color: .red))

            statusMessage = "\(petName) got some rest."
        }

        if handleDeathIfNeeded() {
            newFeedback.append(ActionFeedbackItem(text: "\(petName) has died", color: .gray))
            statusMessage = "\(petName) has died. Revive using all your remaining money."
        }

        feedbackItems = newFeedback
    }

    func purchaseUpgrade(for type: PetStatType) {
        guard money >= upgradeCost else { return }

        money -= upgradeCost

        var item = stat(for: type)
        item.maximum += upgradeAmount
        item.current = min(item.current, item.maximum)
        stats[type] = item

        feedbackItems = [
            ActionFeedbackItem(text: "-$\(upgradeCost) Wallet", color: .red),
            ActionFeedbackItem(text: "+\(upgradeAmount) Max \(type.title)", color: .green)
        ]
        statusMessage = "\(type.title) max increased to \(item.maximum)."
    }

    func revive() {
        guard isDead, money > 0 else { return }

        let reviveCost = money
        money = 0

        for type in PetStatType.allCases {
            var item = stat(for: type)
            item.current = max(item.maximum / 2, 1)
            stats[type] = item
        }

        isDead = false
        feedbackItems = [
            ActionFeedbackItem(text: "Revived \(petName)", color: .blue),
            ActionFeedbackItem(text: "-$\(reviveCost) Wallet", color: .red)
        ]
        statusMessage = "\(petName) was revived at half health."

        startTimer()
    }

    private func startTimer() {
        stopTimer()

        timerCancellable = Timer
            .publish(every: passiveDrainInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.drainStats()
            }
    }

    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }

    private func drainStats() {
        guard !isDead else { return }

        for type in PetStatType.allCases {
            decrease(type, by: passiveDrainAmount)
        }

        if handleDeathIfNeeded() {
            feedbackItems = [
                ActionFeedbackItem(text: "\(petName) has died", color: .gray)
            ]
            statusMessage = "\(petName) has died. Revive using all your remaining money."
        }
    }

    @discardableResult
    private func handleDeathIfNeeded() -> Bool {
        let shouldDie = PetStatType.allCases.contains { stat(for: $0).current <= 0 }

        if shouldDie && !isDead {
            isDead = true
            stopTimer()
            return true
        }

        return false
    }

    private func increase(_ type: PetStatType, by amount: Int) {
        var item = stat(for: type)
        item.current = min(item.current + amount, item.maximum)
        stats[type] = item
    }

    private func decrease(_ type: PetStatType, by amount: Int) {
        var item = stat(for: type)
        item.current = max(item.current - amount, 0)
        stats[type] = item
    }
}
