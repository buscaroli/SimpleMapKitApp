//
//  LocationModel.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import SwiftUI
import CoreLocation
import MapKit

enum PinType: String, CaseIterable {
    case heart = "Loved"
    case leaf = "Liked"
    case flame = "Hated"
    case moon = "Wish to visit"
}

class Location: NSObject, MKAnnotation, Identifiable {
    var id = UUID()
    var title: String?
    var subtitle: String?
    var desc: String?
    var pin: PinType
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, desc: String, pin: PinType = .heart, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.pin = pin
        self.coordinate = coordinate
    }
    
    func getPinLabel(_ pin: PinType) -> String {
        switch pin {
        
        case .heart:
            return "heart.fill"
        case .leaf:
            return "leaf.fill"
        case .flame:
            return "flame.fill"
        case .moon:
            return "moon.fill"
        }
    }
    
    func getPinColor(_ pin: PinType) -> Color {
        switch pin {
            
        case .heart:
            return Color.pink
        case .leaf:
            return Color.green
        case .flame:
            return Color.red
        case .moon:
            return Color.yellow
        }
    }
}
