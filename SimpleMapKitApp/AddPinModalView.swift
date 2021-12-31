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
    @State private var opinions: [PinType] = [.heart, .leaf, .flame, .moon]
    @State private var opinionSelection: PinType = .heart
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("New Location")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
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
            
            Text("Your Thought:")
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom, -50)
            Picker("Your Thought", selection: $opinionSelection) {
                ForEach(opinions, id: \.self) { item in
                    Text("\(item.rawValue)")
                        .foregroundColor(.black)
                }
            }
            .pickerStyle(.wheel)
            // .background(Color.red)
            
            
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
                newLocation.pin = opinionSelection
                
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
                                  coordinate: CLLocationCoordinate2D(latitude: 44.498, longitude: 11.327))
}

struct AddPinModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddPinModalView(newLocation: .constant(Location.example))
    }
}
