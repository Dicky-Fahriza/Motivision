//
//  ContentView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TargetView()
                .tabItem {
                    Label("Target", systemImage: "scope")
                }
            MotivationView()
                .tabItem {
                    Label("Motivation", systemImage: "figure.walk.motion")
                }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
