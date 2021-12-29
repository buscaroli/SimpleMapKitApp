//
//  LocationModel.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import CoreLocation
import MapKit

enum PinType: String {
    case heart  // implicit raw value of heart
    case leaf
    case flame
    case moon
}

struct Location: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var description: String
    var pin: PinType
    var coordinate: MKPointAnnotation
}
