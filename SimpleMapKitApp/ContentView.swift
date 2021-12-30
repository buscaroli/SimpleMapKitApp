//
//  ContentView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State var centerCoordinate =  CLLocationCoordinate2D()
    @State var locations = [Location]()
    @State var newLocation = Location(title: "", subtitle: "", desc: "", coordinate: MKPointAnnotation.example.coordinate)
    @State private var presentingModal = false
    
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                MapView(centerCoordinate: $centerCoordinate, locations: locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(.indigo)
                    .opacity(0.3)
                    .frame(width: 24, height: 24)
            }
            
            
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 50)
                
                
                HStack(spacing: 60) {
                    Button(action: {
                        
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.heart, coordinate: centerCoordinate)
                        presentingModal = true
                        
                        self.locations.append(newLocation)
                        // DEBUG
                        for (num, loc) in locations.enumerated() {
                            print("\(num): lat:\(loc.coordinate.latitude), lon: \(loc.coordinate.longitude)\n")
                        }
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                        
                    }
                    
                    Button(action: {
                        let newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.leaf, coordinate: centerCoordinate)
                        locations.append(newLocation)
                        print(locations)
                        
                    }) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                        
                    }
                    
                    Button(action: {
                        let newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.flame, coordinate: centerCoordinate)
                        locations.append(newLocation)
                        print(locations)
                        
                    }) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        let newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.moon, coordinate: centerCoordinate)
                        locations.append(newLocation)
                        print(locations)
                        
                    }) {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.yellow)
                        
                    }
                }
                .font(.title)
                .foregroundColor(.white)
                .padding(.top)
            }
            
            
        }
        .sheet(isPresented: $presentingModal) {
            AddPinModalView(newLocation: $newLocation)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
