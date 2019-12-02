//
//  LedgerEntry+CoreDataProperties.swift
//  Piggy.io
//
//  Created by Brandon Clark on 11/10/19.
//  Copyright © 2019 cyanware. All rights reserved.
//
//

import Foundation
import CoreData


extension LedgerEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LedgerEntry> {
        return NSFetchRequest<LedgerEntry>(entityName: "LedgerEntry")
    }

    @NSManaged public var transactionDate: Date?
    @NSManaged public var transactionAmount: Int32
    @NSManaged public var transactionMemo: String?
    @NSManaged public var transactionFinalTotal: Int32
    @NSManaged public var stash: Stash?

}
