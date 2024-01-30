//
//  ContentView.swift
//  MacLandmarks
//
//  Created by 周祥鹏 on 2024/1/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
