//
//  MapView.swift
//  CarMobile
//
//  Created by white4ocolate on 16.12.2024.
//

import SwiftUI
import MapKit

struct MapView: View {

    let location = CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)
    
    var body: some View {
        Map {
            Marker("Colosseum", coordinate: location)
        }
        .mapStyle(.imagery(elevation: .realistic))
    }
}

#Preview {
    Map()
}
