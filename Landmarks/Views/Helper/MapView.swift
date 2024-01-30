//
//  MapView.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, Identifiable, CaseIterable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    // Region 地区 Coordinate 协调
    private var region: MKCoordinateRegion {
           MKCoordinateRegion(
               // longitude: 经度 latitude: 纬度
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
           )
       }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
