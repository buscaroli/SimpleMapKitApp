//
//  LocationModel.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import Foundation
import CoreLocation
import MapKit

enum PinType: String {
    case heart  // implicit raw value of heart
    case leaf
    case flame
    case moon
}

class Location: Identifiable {
    var id = UUID()
    var title: String?
    var subtitle: String?
    var desc: String?
    var pin: PinType
    var location: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, desc: String, pin: PinType = .heart, location: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.pin = pin
        self.location = location
    }
    
//    init(pin: PinType, coordinate: CLLocationCoordinate2D) {
//        self.title = ""
//        self.subtitle = ""
//        self.desc = ""
//        self.pin = pin
//        self.coordinate = coordinate
//    }
}
