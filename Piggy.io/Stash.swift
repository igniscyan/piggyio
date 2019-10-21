//
//  Stash.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/7/19.
//  Copyright © 2019 cyanware. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class Stash: NSManagedObject {
        
    @NSManaged var stashName: String
    @NSManaged var stashTotal: Int32
    @NSManaged var stashCurrency: String
    @NSManaged va r stashInitDate: Date
    
    
    // Create our dictionary to hold the value for the stash
    @NSManaged var dollarCounts : [Int32]
    
    
    func getTotal()-> Int32 {
        
        let oneTotal: Int32 = self.dollarCounts[0] * 1
        let fiveTotal: Int32 = self.dollarCounts[1] * 5
        let tenTotal: Int32 = self.dollarCounts[2] * 10
        let twentyTotal: Int32 = self.dollarCounts[3] * 20
        let fiftyTotal: Int32 = self.dollarCounts[4] * 50
        let hundredTotal: Int32 = self.dollarCounts[5] * 100
        
        let finalTotal = oneTotal + fiveTotal + tenTotal + twentyTotal + fiftyTotal + hundredTotal
        return finalTotal
        
    }
    //
    
    init(name : String, total : Int32, currencyType: String, counts: [Int32] ) {
        self.stashName = name
        self.stashTotal = total
        self.stashCurrency = currencyType
        self.dollarCounts = counts
    }
    

  }
