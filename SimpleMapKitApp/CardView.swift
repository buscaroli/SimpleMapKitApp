//
//  CardView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 31/12/2021.
//

import SwiftUI

struct CardView: View {
    var place: Location
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            
            HStack (alignment: .center, spacing: 10) {
                Image(systemName: place.getPinLabel(place.pin))
                    .foregroundColor(place.getPinColor(place.pin))
                Text(place.title ?? "")
                    
            }
            .font(.title)
            
            Text(place.subtitle ?? "")
                .font(.title3)
                .fontWeight(.semibold)
                
            Text(place.desc ?? "")
                .font(.body)
        }
        .frame(maxWidth: .infinity )
        .padding(.vertical)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 2)
            )
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(place: Location.example)
    }
}
