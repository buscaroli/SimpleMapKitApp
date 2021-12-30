//
//  ContentViewModel.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 30/12/2021.
//

import MapKit
import SwiftUI


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Optional as user could have turned it off
    var  locationManager: CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
            // The following call would only checks the authorization when we stat the app. If the user jumps to settings and decides to turn the authorization off we are not covered. This is why we adhere to the CLLocationManagerDelegate and add the locationManagerDidChangeAuthorization function. Also, the locationManagerDidChangeAuthorization function is also called at the start of the app, so the following call is redundant.
            
            // checkLocationAuthorization()
            
        } else {
            print("Can't do")
        }
    }
    
    // Made private as only used in this screen. If you try to do an autocomplete on ContentView it won't show up.
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
    
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Alert location is restricted likely do to parental controls.")
        case .denied:
            print("You have denied this app access to your location.")
        case .authorizedAlways,
             .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    // We need to be alerted when the user changes the location access authorisation
    // We can use this thanks to CLLocationManagerDelegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
        
        
}
