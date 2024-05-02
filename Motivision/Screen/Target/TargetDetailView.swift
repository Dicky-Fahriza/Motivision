//
//  TargetDetailView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct TargetDetailView: View {
    let target: TargetModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // HERO IMAGE
            Image(target.image)
                .resizable()
                .scaledToFit()
            
            // TITLE
            Text(target.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .background(
                    Color.blue
                        .frame(height: 6)
                        .offset(y: 24)
                )
            
            // HEADLINE
//            Text(target.headline)
//                .font(.headline)
//                .foregroundStyle(.blue)
//                .padding()
//            
//            .padding(.horizontal)
            
         
                            
        

    
        }

        HomeView()
        
        
        .navigationTitle("Learn about \(target.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    let targets: [TargetModel] = Bundle.main
        .decode("target.json")
    
    return NavigationStack {
        TargetDetailView(target: targets[4])
    }
}
