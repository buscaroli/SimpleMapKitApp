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
    @Binding var locations: [Location]
    
    // Display the Map
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Centering the starting map view on the city of Bologna (centerOn) with a zoom of 8.0 (span)
        let centerOn = CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32)
        let span = MKCoordinateSpan(latitudeDelta: 8.0, longitudeDelta: 8.0)
        let region = MKCoordinateRegion(center: centerOn, span: span)
        mapView.setRegion(region, animated: false)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        // Everytime the map view is moved this function  is called.
        // The current annotations are removed, the new annotation is added to the array and the map is refreshed.
        if view.annotations.count != locations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(locations)
            
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
            
            view.pinTintColor = getPinColor(pin: parent.locations.last?.pin ?? PinType.leaf)
            
            return view
        }
        
        // Returns the color of the pin depending on its type
        func getPinColor(pin: PinType) -> UIColor {
            print(pin)
            switch pin {
            case .heart:
                return (UIColor.red)
            case .leaf:
                return (UIColor.green)
            case .flame:
                return (UIColor.orange)
            case .moon:
                return (UIColor.yellow)
            }
        }
        
        // Returns the icon of the pin depending on its type
        func getPinIcon(pin: PinType) -> String {
            print(pin)
            switch pin {
            case .heart:
                return ("heart.fill")
            case .leaf:
                return ("leaf.fill")
            case .flame:
                return ("flame.fill")
            case .moon:
                return ("moon.fill")
            }
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


//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), locations: [Location]())
//    }
//}
