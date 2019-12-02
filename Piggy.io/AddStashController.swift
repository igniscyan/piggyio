//
//  AddStashController.swift
//  Piggy.io
//
//  Created by Brandon Clark on 12/1/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit
import CoreData

class AddStashController: UIViewController {
    
    @IBOutlet weak var oneStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var twentyStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var hundredStepper: UIStepper!
    
    
    @IBOutlet weak var onesCount: UILabel!
    @IBOutlet weak var fivesCount: UILabel!
    @IBOutlet weak var tensCount: UILabel!
    @IBOutlet weak var twentiesCount: UILabel!
    @IBOutlet weak var fiftiesCount: UILabel!
    @IBOutlet weak var hundredsCount: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
 
    @IBAction func onesChange(_ sender: UIStepper) {
        onesCount.text = Int(sender.value).description
    }
    
    @IBAction func fivesChanged(_ sender: UIStepper) {
        fivesCount.text = Int(sender.value).description
    }
    
    @IBAction func tensChange(_ sender: UIStepper) {
        tensCount.text = Int(sender.value).description
    }
    
    @IBAction func twentiesChange(_ sender: UIStepper) {
        twentiesCount.text = Int(sender.value).description
    }
    

    @IBAction func fiftiesChange(_ sender: UIStepper) {
        fiftiesCount.text = Int(sender.value).description
    }
    
    @IBAction func hundredsChange(_ sender: UIStepper) {
        hundredsCount.text = Int(sender.value).description
    }
    

    
    var stash = [Stash]()
    var ledgerEntry = [LedgerEntry]()
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let stashFetchRequest: NSFetchRequest<Stash> = Stash.fetchRequest()
        
        do {
            let stash = try PersistenceService.context.fetch(stashFetchRequest)
            self.stash = stash
        }   catch {print("Error fetching conetxt")}
    

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func savePress(_ sender: UIButton) {
        let stashContext = Stash(context: PersistenceService.context)
        let stashName = nameField.text
        let numOnes:Int32? = Int32(onesCount.text!)
        let numFives:Int32? = Int32(fivesCount.text!)
        let numTens:Int32? = Int32(tensCount.text!)
        let numTwenties:Int32? = Int32(twentiesCount.text!)
        let numFifties:Int32? = Int32(fiftiesCount.text!)
        let numHundreds:Int32? = Int32(hundredsCount.text!)
        
        stashContext.stashName = stashName
        stashContext.stashCurrency = "USD"
        stashContext.stashInitDate = Date()
        stashContext.ones = numOnes!
        stashContext.fives = numFives!
        stashContext.tens = numTens!
        stashContext.twenties = numTwenties!
        stashContext.fifties = numFifties!
        stashContext.hundreds = numHundreds!
        let onesTotal : Int32 = (1 * numOnes!)
        let fivesTotal : Int32 = (5 * numFives!)
        let tensTotal : Int32 = (10 * numTens!)
        let twentiesTotal : Int32 = (20 * numTwenties!)
        let fiftiesTotal : Int32 = (50 * numFifties!)
        let hundredsTotal : Int32 = (100 * numHundreds!)
        let stashValue = onesTotal + fivesTotal + tensTotal + twentiesTotal + fiftiesTotal + hundredsTotal
        stashContext.stashTotal = stashValue
        
        let ledgerContext = LedgerEntry(context:PersistenceService.context)
        ledgerContext.stash = stashContext
        ledgerContext.transactionAmount = stashValue
        ledgerContext.transactionDate = Date()
        ledgerContext.transactionMemo = "Stash initialization"
        ledgerContext.transactionFinalTotal = stashValue
        
        stashContext.addToLedgerEntry(ledgerContext)
        PersistenceService.saveContext()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
