//
//  Stash.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/7/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit


class Stash {
    var stashName: String?
    var stashTotal: Int32?
    var stashCurrency: String?
    var stashInitDate: Date?
    
    // Create our dictionary to hold the value for the stash
    var dollarCounts:[String:Int] = ["Ones": 0, "Fives": 0, "Tens": 0, "Twenties": 0, "Hundreds": 0]
    var dollarValues:[String:Int] = ["Ones": 1, "Fives": 5, "Tens": 10, "Twenties": 20, "Hundreds": 100]
    
    //
    
    
  }
