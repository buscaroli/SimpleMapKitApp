//
//  MapView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var locations: [Location]
    
    // Display the Map
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32)
//        annotation.title = "Bologna"
//        annotation.subtitle = "La Bella, la Grassa, la Dotta."
//        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if locations.count != view.annotations.count {
//            let locationCoordinates = locations.map {$0.coordinate}
            
            view.removeAnnotations(view.annotations)
//            view.addAnnotations(locationCoordinates)
            _ = locations.map {view.addAnnotation($0.coordinate)}
            print("locations: \(locations)")
//            print("locationCoordinates: \(locationCoordinates)")
        }
    }
    
    // Work on the Map
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

// Example for the Preview
extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Bologna"
        annotation.subtitle = "The Red, the Literate and the Fat."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 44.498, longitude: 11.327)
        return annotation
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), locations: [Location]())
    }
}
