//
//  LocationModel.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import CoreLocation

enum PinType: String {
    case heart  // implicit raw value of heart
    case leaf
    case flame
    case moon
}

struct Location {
    var title: String
    var subtitle: String
    var description: String
    var pin: PinType
    var coordinate: CLLocationCoordinate2D
}
