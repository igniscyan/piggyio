//
//  Stash+CoreDataProperties.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/23/19.
//  Copyright © 2019 cyanware. All rights reserved.
//
//

import Foundation
import CoreData


extension Stash {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stash> {
        return NSFetchRequest<Stash>(entityName: "Stash")
    }

    @NSManaged public var dollarCounts: NSObject?
    @NSManaged public var stashCurrency: String?
    @NSManaged public var stashInitDate: Date?
    @NSManaged public var stashName: String?
    @NSManaged public var stashTotal: Int32
    @NSManaged public var ones: Int32
    @NSManaged public var fives: Int32
    @NSManaged public var tens: Int32
    @NSManaged public var twenties: Int32
    @NSManaged public var fifties: Int32
    @NSManaged public var hundreds: Int32
    

}
