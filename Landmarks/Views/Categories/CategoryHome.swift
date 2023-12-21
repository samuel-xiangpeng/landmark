//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2024/1/17.
//

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView{
            List {
                // 图片轮播
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categoiies.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: ModelData().categoiies[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            // .navigationTitle("Feature")
            // 右上角工具栏
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    Text("Feature")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, -10)
                }
               
            }
            // 用户信息遮罩
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
