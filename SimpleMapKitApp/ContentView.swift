//
//  ContentView.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 28/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 0){
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: .infinity, height: 50)
                
                
                HStack(spacing: 50) {
                    Image(systemName: "star")
                    
                    Image(systemName: "heart")
                    
                    Image(systemName: "cross")
                    
                    Image(systemName: "person")
                    
                }
                .font(.title)
                .foregroundColor(.white)
            }
            
            
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
