//
//  AddPinModalView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 30/12/2021.
//

import SwiftUI
import CoreLocation

struct AddPinModalView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var newLocation: Location
    
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var desc: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Location")
                .font(.largeTitle)
                .padding(.bottom, 80)
            TextField("Title:", text: $title)
                .font(.title3)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
                .padding()
            TextField("Subtitle:", text: $subtitle)
                .font(.title3)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
                .padding()
            
            Text("Description:")
                .font(.title)
                .foregroundColor(.black)
                
            TextEditor(text: $desc)
                .font(.title3)
                .foregroundColor(.black)
                .frame(minHeight: 200)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Spacer()
            
            Button("Save") {
                newLocation.title = title
                newLocation.subtitle = subtitle
                newLocation.desc = desc
                
                self.presentation.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(.infinity)
            .shadow(color: .gray, radius: 6, x: 0, y: 0)
        }
    }
}

extension Location {
    static var example = Location(title: "Bologna",
                                  subtitle: "La Rossa, La Grassa e la Dotta.",
                                  desc: "Wonderful University and Food Capital of Italy.",
                                  location: CLLocationCoordinate2D(latitude: 44.498, longitude: 11.327))
}

struct AddPinModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddPinModalView(newLocation: .constant(Location.example))
    }
}
