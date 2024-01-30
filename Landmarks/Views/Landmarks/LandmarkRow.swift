//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    //body里面就是之前react中的return返回的渲染的视图
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

// 这下面只是定义的预览，相当于是测试
#Preview("Turtle Rock") {
    let landmarks = ModelData().landmarks
    return Group {
        // landmarks 这个数组类的对象目前在ModelData中有定义
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
    
}
