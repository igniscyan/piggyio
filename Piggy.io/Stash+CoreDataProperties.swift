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

}
