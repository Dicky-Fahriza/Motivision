//
//  TargetListItemView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct TargetListItemView: View {
    
    let target: TargetModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(target.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(target.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(target.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    let targets: [TargetModel] =  Bundle.main.decode("target.json")
    return TargetListItemView(target: targets[1])
}
