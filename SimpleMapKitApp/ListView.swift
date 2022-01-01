//
//  ListView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 30/12/2021.
//

import SwiftUI
import MapKit

struct ListView: View {
    @Binding var locations: [Location]
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            NavigationView {
                
                    List {
                        ForEach(locations, id: \.id) { place in
                            CardView(place: place)
                        }
                        .onDelete(perform: delete)
                    }
                    .padding(.top)
                    .listStyle(.plain)
                    .navigationTitle("Your Places")
            }
                
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Map")
                    .foregroundColor(.white)
            }
            .font(.title)
            .padding()
            .background(.black)
            .cornerRadius(.infinity)
            .shadow(color: .gray, radius: 6, x: 0, y: 0)
        }
    }
    
    func delete(at indexes: IndexSet) {
        if let first = indexes.first {
            locations.remove(at: first)
        }
    }

}


extension Location {
    static var exampleList = [
        Location(title: "Bologna", subtitle: "La Rossa, la Grassa e la Dotta.", desc: "Wonderful, wish I could get back.", pin: PinType.heart, coordinate: CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32)),
        Location(title: "London", subtitle: "Capital of England", desc: "Visited a few times, very busy city, largest in Europe.", pin: PinType.leaf, coordinate: CLLocationCoordinate2D(latitude: 51.50, longitude: 0.12)),
        Location(title: "Bournemouth", subtitle: "London on the Sea.", desc: "Great beaches, walks and crowded in summer.", pin: PinType.moon, coordinate: CLLocationCoordinate2D(latitude: 50.72, longitude: 1.88))
    ]
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(locations: .constant(Location.exampleList))
    }
}
