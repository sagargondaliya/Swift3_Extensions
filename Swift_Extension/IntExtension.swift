//
//  IntExtension.swift
//
//  Created by Sagar Gondaliya on 22/12/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import Foundation
extension Int {
    
    func convertCmToInch() -> String {
        
        let inchInCM : Float = 2.54
        let inches : Int = Int(roundf(Float(self) / inchInCM))
        print("TOTAL INCHES: \(inches)")
        
        let feet = inches / 12
        print("Feet :\(feet)")
        
        let inche = inches % 12
        print("inche :\(inche)")
        
        let footInch = "\(feet)' \(inche)\""
        return footInch
        
    }
}
