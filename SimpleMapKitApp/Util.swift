//
//  Util.swift
//  SimpleMapKitApp
//
//  Created by Matteo on 30/12/2021.
//

import SwiftUI

//  Returns the color of the pin depending on its type
    func getPinColor(pin: PinType) -> Color {
        print(pin)
        switch pin {
        case .heart:
            return (Color.pink)
        case .leaf:
            return (Color.green)
        case .flame:
            return (Color.red)
        case .moon:
            return (Color.yellow)
        }
    }
    
//  Returns the icon of the pin depending on its type
    func getPinIcon(pin: PinType) -> String {
        print(pin)
        switch pin {
        case .heart:
            return ("heart.fill")
        case .leaf:
            return ("leaf.fill")
        case .flame:
            return ("flame.fill")
        case .moon:
            return ("moon.fill")
        }
    }
    
    
