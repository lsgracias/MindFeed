//
//  ContentView.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcome = true
    @State private var hasCompletedOnboarding = false
    
    var body: some View {
        NavigationStack {
            if showWelcome {
                WelcomeScreen(isPresented: $showWelcome)
            } else if !hasCompletedOnboarding {
                TopicSelectionView(onComplete: {
                    hasCompletedOnboarding = true
                })
            } else {
                ContentFeedView()
            }
        }
    }
}

#Preview {
    ContentView()
}
