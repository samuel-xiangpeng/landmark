//
//  MapView.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    // Region 地区 Coordinate 协调
    private var region: MKCoordinateRegion {
           MKCoordinateRegion(
               // longitude: 经度 latitude: 纬度
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
           )
       }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
