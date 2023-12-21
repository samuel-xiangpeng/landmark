//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2024/1/17.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: true){
                HStack(alignment: .top, spacing: 10){
                    ForEach(items) { landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryRowItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
//            .background(.red)
        }
    }
}

struct CategoryRowItem: View {
    
    let landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
                
        }
    }
}


#Preview {
    let landmarks = ModelData().landmarks
    
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}


#Preview("CategoryRowItem") {
    CategoryRowItem(landmark: ModelData().landmarks[0])
}
