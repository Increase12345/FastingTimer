//
//  ProgressRing.swift
//  FastingTimer
//
//  Created by Nick Pavlov on 5/28/23.
//

import SwiftUI

struct ProgressRing: View {
    @State private var progress = 0.0
    
    var body: some View {
        ZStack {
            // MARK: Placeholder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                // MARK: Elapsed Time
                VStack(spacing: 5) {
                    Text("Elapdes time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title.bold())
                }
                .padding(.top)
                
                // MARK: Remaining Time
                VStack(spacing: 5) {
                    Text("Remaining time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title2.bold())
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
