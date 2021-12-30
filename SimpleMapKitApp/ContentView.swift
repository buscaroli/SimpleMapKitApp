//
//  ContentView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State var centerCoordinate =  CLLocationCoordinate2D()
    @State var locations = [Location]()
    @State var newLocation = Location(title: "", subtitle: "", desc: "", location: CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32))
    @State private var presentingModal = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32),
                                                   span: MKCoordinateSpan(latitudeDelta: 4.0, longitudeDelta: 4.0))
    
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locations) { place in
                    MapAnnotation(coordinate: place.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        let color = getPinColor(pin: place.pin)
                        ZStack {
                            Image(systemName: getPinIcon(pin: place.pin))
                                .padding()
                            
                            Circle()
                            .stroke(color)
                            .frame(width: 24, height: 24)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: viewModel?.checkIfLocationServiceIsEnabled())
                
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
                        
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.heart, location: centerCoordinate)
                        presentingModal = true
                        
                        self.locations.append(newLocation)
                        // DEBUG
                        print(locations.last?.pin)
                        for (num, loc) in locations.enumerated() {
                            print("\(num): lat:\(loc.location.latitude), lon: \(loc.location.longitude)\n")
                        }
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                        
                    }
                    
                    Button(action: {
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.leaf, location: centerCoordinate)
                        presentingModal = true
                        
                        
                        self.locations.append(newLocation)
                        print(locations.last?.pin)
                        
                    }) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                        
                    }
                    
                    Button(action: {
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.flame, location: centerCoordinate)
                        presentingModal = true
                        
                        self.locations.append(newLocation)
                        print(locations.last?.pin)
                        
                    }) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        newLocation = Location(title: "Title", subtitle: "Subtitle goes here", desc: "A Very long description goes here.", pin: PinType.moon, location: centerCoordinate)
                        presentingModal = true
                        
                        self.locations.append(newLocation)
                        print(locations.last?.pin)
                        
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
