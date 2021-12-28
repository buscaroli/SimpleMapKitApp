//
//  ContentView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                MapView(centerCoordinate: $centerCoordinate)
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
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                        
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                        
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        
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
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
