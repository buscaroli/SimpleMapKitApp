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
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(locations) { loc in
                        Group{
                            Text("\(loc.title ?? "Title")").font(.title)
                            Text("\(loc.subtitle ?? "Subtitle")").font(.title3)
                            Text("\(loc.desc ?? "")").font(.caption)
                        }
                        
                    }
                }
            }
            .navigationTitle("Your Places")
            .ignoresSafeArea(edges: .bottom)
            .padding(.vertical)
        }
        
    }
}

extension Location {
    static var exampleList = [
        Location(title: "Bologna", subtitle: "La Rossa, la Grassa e la Dotta.", desc: "Wonderful, wish I could get back.", coordinate: CLLocationCoordinate2D(latitude: 44.49, longitude: 11.32)),
        Location(title: "London", subtitle: "Capital of England", desc: "Visited a few times, very busy city, largest in Europe.", coordinate: CLLocationCoordinate2D(latitude: 51.50, longitude: 0.12)),
        Location(title: "Bournemouth", subtitle: "London on the Sea.", desc: "Great beaches, walks and crowded in summer.", coordinate: CLLocationCoordinate2D(latitude: 50.72, longitude: 1.88))
    ]
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(locations: .constant(Location.exampleList))
    }
}
