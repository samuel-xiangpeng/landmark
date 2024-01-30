//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by 周祥鹏 on 2024/1/30.
//

import SwiftUI

struct LandmarkSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }.pickerStyle(.inline)
        }
        .frame(width: 300)
        .padding(80)
        .navigationTitle("Landmark Settings")
    }
}

#Preview {
    LandmarkSettings()
}
