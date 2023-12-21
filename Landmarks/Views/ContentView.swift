//
//  ContentView.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .badge("主页")
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .badge(10)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
