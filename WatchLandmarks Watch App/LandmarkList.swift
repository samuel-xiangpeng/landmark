//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    
    @State private var showFavoritesOnly = false

    
    // 过滤数据
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // IOS SwiftUI 列表类型
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
