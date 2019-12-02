//
//  Stash+CoreDataProperties.swift
//  Piggy.io
//
//  Created by Brandon Clark on 11/11/19.
//  Copyright © 2019 cyanware. All rights reserved.
//
//

import Foundation
import CoreData


extension Stash {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stash> {
        return NSFetchRequest<Stash>(entityName: "Stash")
    }

    @NSManaged public var fifties: Int32
    @NSManaged public var fives: Int32
    @NSManaged public var hundreds: Int32
    @NSManaged public var ones: Int32
    @NSManaged public var stashCurrency: String?
    @NSManaged public var stashInitDate: Date?
    @NSManaged public var stashName: String?
    @NSManaged public var stashTotal: Int32
    @NSManaged public var tens: Int32
    @NSManaged public var twenties: Int32
    @NSManaged public var ledgerEntry: NSSet?

}

// MARK: Generated accessors for ledgerEntry
extension Stash {

    @objc(addLedgerEntryObject:)
    @NSManaged public func addToLedgerEntry(_ value: LedgerEntry)

    @objc(removeLedgerEntryObject:)
    @NSManaged public func removeFromLedgerEntry(_ value: LedgerEntry)

    @objc(addLedgerEntry:)
    @NSManaged public func addToLedgerEntry(_ values: NSSet)

    @objc(removeLedgerEntry:)
    @NSManaged public func removeFromLedgerEntry(_ values: NSSet)

}
