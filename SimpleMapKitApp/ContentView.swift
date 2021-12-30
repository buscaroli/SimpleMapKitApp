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
    @State private var showingList = false
    
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                MapView(centerCoordinate: $centerCoordinate, locations: $locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(.indigo)
                    .opacity(0.3)
                    .frame(width: 24, height: 24)
            }
            
            
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 60)
                
                
                HStack(spacing: 160) {
                    Button(action: {
                        
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.heart, coordinate: centerCoordinate)
                        presentingModal = true
                        
                        self.locations.append(newLocation)
                        // DEBUG
                        print(locations.last?.pin)
//                        for (num, loc) in locations.enumerated() {
//                            print("\(num): lat:\(loc.coordinate.latitude), lon: \(loc.coordinate.longitude)\n")
//                        }
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.largeTitle)
                        
                    }
                    
                    Button(action: {
                        self.showingList = true
                        
                    }) {
                        Image(systemName: "list.star")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                    }
                    
                }
                .font(.title)
                .foregroundColor(.white)
                .padding(.top)
            }
            .sheet(isPresented: $showingList) {
                ListView(locations: $locations)
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
