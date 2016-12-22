//
//  ArrayExtension.swift
//
//  Created by Sagar Gondaliya on 22/12/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == String {
    
    func sortHeightArray(replacementString : String) -> [String]{
        
        var sortedArray = [String]()
        
        //remove cm from String
        
        var heightIntArray = self.map{Int(($0.slice(from: "(", to: ")")!).replacingOccurrences(of: replacementString, with: ""))!}
        heightIntArray = heightIntArray.sorted{$0 < $1}
        let footInchArray = heightIntArray.map{$0.convertCmToInch()}
        
        for (index, _) in heightIntArray.enumerated() {
            
            let footInchHeight = "\(footInchArray[index] )"
            //print("footInchHeight: \(footInchHeight)")
            
            let cmHeight = "\(heightIntArray[index])\(replacementString)"
            //print("cmHeight: \(cmHeight)")
            
            let finalHeight = footInchHeight + " (" + cmHeight + ")"
            //print("Final Height : \(finalHeight)")
            
            sortedArray.append(finalHeight)
        }
        return sortedArray
    }
    
    func sortWeightArray(firstReplacement: String, secondReplacement : String) -> [String]{
        
        var sortedArray = [String]()
        
        //remove kg from string
        var weightKgArray = self.map{Int(($0.slice(from: "(", to: ")")!).replacingOccurrences(of: secondReplacement, with: ""))!}
        
        var weightLbsArray = self.map{Int($0.replacingOccurrences(of: " ", with: "").components(separatedBy: firstReplacement)[0])!}
        
        weightKgArray = weightKgArray.sorted{$0 < $1}
        weightLbsArray = weightLbsArray.sorted{$0 < $1}
        
        for (index, _) in weightKgArray.enumerated() {
            
            let weightInKg = "\(weightKgArray[index] ) \(secondReplacement)"
            let weightInLbs = "\(weightLbsArray[index]) \(firstReplacement))"
            
            let finalWeight = weightInLbs + " (" + weightInKg + ")"
            //print("Final Weight : \(finalWeight)")
            
            sortedArray.append(finalWeight)
        }
        return sortedArray
    }
}
