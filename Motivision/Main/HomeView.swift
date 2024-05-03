//
//  HomeView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var goalsKey = UserDefaults.standard.string(forKey: "GoalsKey") ?? "" // Memuat nilai GoalsKey dari UserDefaults
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goals"), footer: Text("Please input your goals above.")) {
                    TextEditor(text: $goalsKey)
                        .frame(height: 200)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
                }
            }
            .navigationTitle("Target Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: saveKey) {
                    Text("Save")
                }
            }
        }
    }
    
    func saveKey() {
        UserDefaults.standard.set(goalsKey, forKey: "GoalsKey")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
