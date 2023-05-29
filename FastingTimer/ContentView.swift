//
//  ContentView.swift
//  FastingTimer
//
//  Created by Nick Pavlov on 5/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fastingManager = FastingManager()
    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let's get started"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color(#colorLiteral(red: 0.05993167311, green: 0.006892288104, blue: 0.09845115989, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                // MARK: Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                
                // MARK: Fasting Plan
                Text(fastingManager.fastingPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
                // MARK: Progress Ring
            VStack(spacing: 40) {
                ProgressRing()
                
                HStack(spacing: 60) {
                    // MARK: Start time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "Start": "Started")
                            .opacity(0.7)
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    // MARK: End time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "End": "Ends")
                            .opacity(0.7)
                        Text(fastingManager.endTime.addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                }
                
                // MARK: Button
                Button{
                    fastingManager.toggleFastingState()
                } label: {
                    Text(fastingManager.fastingState == .fasting ? "End fast": "Start fasting")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
