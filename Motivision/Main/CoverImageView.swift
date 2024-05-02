//
//  CoverImageView.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImageModel] =  Bundle.main.decode("covers.json")
    
    @State private var showingSheet = false
    @State private var selectedCover: CoverImageModel?
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                    showingSheet.toggle()
                    selectedCover = item
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
