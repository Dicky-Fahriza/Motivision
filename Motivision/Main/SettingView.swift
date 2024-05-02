//
//  SettingView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct SettingView: View {
    @State private var geminiAIKey = ""
    
    let signUpGemini = "https://ai.google.dev"
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK:: - API KEY
                Section {
                    TextField("Gemini AI Key", text: $geminiAIKey)
                        .onAppear {
                            geminiAIKey =
                            UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                } header: {
                    Text("API KEYS")
                } footer: {
                    Text("Please input your API Key above.")
                }
                
                Section {
                    Link("GET API KEY GEMINI AI", destination: URL(string: signUpGemini)!)
                        .foregroundStyle(.blue)
                    
                } header: {
                    Text("DONT'T HAVE API KEYS")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }

            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: - SAVE KEY
                Button {
                    saveKey()
                } label: {
                     Text("Save")
                        .padding(.trailing, 8)
                        .disabled(geminiAIKey.isEmpty)
                }
            }
        }
    }
}

#Preview {
    SettingView()
}

extension SettingView {
    func saveKey() {
        UserDefaults.standard.set(geminiAIKey, forKey: "GeminiAIKey")
    }
}

