//
//  FastingManager.swift
//  FastingTimer
//
//  Created by Nick Pavlov on 5/28/23.
//

import Foundation

enum FastingState {
    case notStarted, fasting, feeding
}

enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var fastingPeriod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
}

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .intermediate
    @Published private(set) var startTime: Date
    @Published private(set) var endTime: Date
    
    var fastingTime: Double {
        fastingPlan.fastingPeriod
    }
    var feedingTime: Double {
        24 - fastingPlan.fastingPeriod
    }
    
    init() {
        let calendar = Calendar.current
//        var comonents = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
//        comonents.hour = 20
//
//        let scheduledTime = calendar.date(from: comonents) ?? Date.now
        
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod)
    }
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding: .fasting
        startTime = Date()
    }
}
