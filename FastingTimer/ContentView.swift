//
//  ContentView.swift
//  FastingTimer
//
//  Created by Nick Pavlov on 5/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // MARK: Background
            Color(#colorLiteral(red: 0.05993167311, green: 0.006892288104, blue: 0.09845115989, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        VStack {
            // MARK: Title
            Text("Let's get started")
            
            // MARK: Progress Ring
            ProgressRing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
