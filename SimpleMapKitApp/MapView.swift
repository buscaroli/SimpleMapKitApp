//
//  MapView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
