//
//  MotivationVM.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class MotivationVM: ObservableObject {
    @Published var motivationText: Place?
    @Published var displayedStoryText = "" // display typewriting effect
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var timer: Timer?
    
    // MARK: - GENERATE STORY
    func generateStory(goals: Goals, motivator: Motivator) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        motivationText = nil
        
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        
        guard !apiKey.isEmpty else {
            errorMessage = "API Key is missing. Please set it in Settings page!"
            return
        }
        
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let goalsString = goals.rawValue.capitalized
        let motivatorString = motivator.rawValue.capitalized
        
//        let prompt = "Tulisan kutipan tentang \(topicString) dengan mood emosi \(moodString) berdasarkan anime naruto. Maksimal terdiri dari 40 kata ."
        
//        let prompt = "Tulisan motivasi untuk goals \(goalsString) hari ini berdasarkan \(motivatorString) . Maksimal terdiri dari 40 kata ."
        let prompt = """
        give me a motivational quote for today's goal \(goalsString) based on \(motivatorString). Provide the outpit is JSON string format as

        {
            "quote": "Your motivational quote here",
            "author": "Author's Name"
        }

        Only remove any backticks
        """
        
        do {
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                let data = text.data(using: .utf8)
                motivationText = try JSONDecoder().decode(Place.self, from: data!)
                startTypewriterEffect()
            }
        } catch  {
            errorMessage = "Failed to generate story: \(error.localizedDescription)"
        }
    }
    
    // MARK: -  TYPEWRITER EFFECT
    func startTypewriterEffect() {
        var charIndex = 0
        DispatchQueue.main.async {
            self.displayedStoryText = ""
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            let quoteText = self!.motivationText?.quote
            let authoText = self!.motivationText?.author
            let joinText = quoteText! + "\n\n"  + (authoText ?? "N/A")
            guard let self = self, charIndex < (joinText.count) else {
                timer.invalidate()
                return
            }
            
            DispatchQueue.main.async {
                let index = joinText.index((joinText.startIndex), offsetBy: charIndex)
                self.displayedStoryText += String((joinText[index]))
                charIndex += 1
            }
        }
    }
}
