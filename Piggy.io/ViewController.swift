//
//  ViewController.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/23/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate {
    

    @IBOutlet weak var totalCashLabel: UILabel!
    @IBOutlet weak var netWeeklyTotalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var stash = [Stash]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let stashFetchRequest: NSFetchRequest<Stash> = Stash.fetchRequest()
        // Do any additional setup after loading the view.
        do {
        let stash = try PersistenceService.context.fetch(stashFetchRequest)
            self.stash = stash
            self.tableView.reloadData()
        }   catch {print("Error fetching context")}
        //MARK: Ledger allocation
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func onPlusTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addStash")
        let addVC = vc as! AddStashController
        /* Try to setup stashVC's properties here */
        
        self.navigationController?.show(addVC, sender: self)
        
        
        /*let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)

         let margin:CGFloat = 10.0
         let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 120)
         let customView = UIView(frame: rect)

         customView.backgroundColor = .green
         alertController.view.addSubview(customView)
        
         var stepper = UIStepper()
        customView.addSubview(stepper)
        
        
        

         let somethingAction = UIAlertAction(title: "Something", style: .default, handler: {(alert: UIAlertAction!) in print("something")})

         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})

         alertController.addAction(somethingAction)
         alertController.addAction(cancelAction)

         DispatchQueue.main.async {
             self.present(alertController, animated: true, completion:{})
         }*/
        
        /*alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Ones"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Fives"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Tens"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Twenties"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Fifties"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Hundreds"
            textField.keyboardType = .numberPad
        }*/
        
        
        /*let action = UIAlertAction(title: "Post", style: .default) { (_) in
            if let textFields = alert.textFields{
                let theTextFields = textFields as [UITextField]
                let stashName = theTextFields[0].text
                let ones = Int32(theTextFields[1].text!)!
                let fives = Int32(theTextFields[2].text!)!
                let tens = Int32(theTextFields[3].text!)!
                let twenties = Int32(theTextFields[4].text!)!
                let fifties = Int32(theTextFields[5].text!)!
                let hundreds = Int32(theTextFields[6].text!)!
                let stashContext = Stash(context: PersistenceService.context)
                //let managedContext = PersistenceService.persistentContainer.viewContext
                //let ledgerEntity = NSEntityDescription.entity(forEntityName: "LedgerEntry", in:managedContext)
                let ledgerContext = LedgerEntry(context:PersistenceService.context)
                
                //Store information to context
                stashContext.stashName = stashName
                stashContext.stashCurrency = "USD"
                stashContext.stashInitDate = Date()
                stashContext.ones = ones
                stashContext.fives = fives
                stashContext.tens = tens
                stashContext.twenties = twenties
                stashContext.fifties = fifties
                stashContext.hundreds = hundreds
                let stashValue : Int32 = (1 * ones) + (5 * fives) + (10 * tens) + (20 * twenties) + (50 * fifties) + (100 * hundreds)
                stashContext.stashTotal = stashValue
                //MIGHT NEED THIS LATER: let initLedger = stashContext.mutableSetValue(forKey: #keyPath(Stash.ledgerEntry))
                //
                //On initialization, create the first ledgerEntry that stores the starting amount of the stash and the first date input for the stash.
                ledgerContext.stash = stashContext
                ledgerContext.transactionAmount = stashValue
                ledgerContext.transactionDate = Date()
                ledgerContext.transactionMemo = "Stash initialization"
                ledgerContext.transactionFinalTotal = stashValue
                
                
                stashContext.addToLedgerEntry(ledgerContext)
                PersistenceService.saveContext()
                self.stash.append(stashContext)
                self.tableView.reloadData()
            }
//            let name = alert.textFields!.first!.text!
//            let amount = alert.textFields!.last!.text!
//            print(name)
//            print(amount)
//            let stashContext = Stash(context: PersistenceService.context)
//            stashContext.stashName = name
//            stashContext.stashTotal = Int32(amount)!
//            PersistenceService.saveContext()
//            self.stash.append(stashContext)
//            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
 */
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        print("PrepareForSegue")
        if segue.identifier == "SegueViews",
            let destination = segue.destination as? StashPageViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.pageString = stash[selectedIndex].stashName!
            destination.totalMoney = stash[selectedIndex].stashTotal
            destination.onesCount =  stash[selectedIndex].ones
            destination.fivesCount = stash[selectedIndex].fives
            destination.tensCount =  stash[selectedIndex].tens
            destination.twentiesCount = stash[selectedIndex].twenties
            destination.fiftiesCount =  stash[selectedIndex].fifties
            destination.hundredsCount = stash[selectedIndex].hundreds
        }
       

    }*/

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stash.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = stash[indexPath.row].stashName
        cell.detailTextLabel?.text = String(stash[indexPath.row].stashTotal)
        return cell
    }
    /*public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let item = stash[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "stashPage")
            let stashVC = vc as! StashPageViewController
            /* Try to setup stashVC's properties here */
            stashVC.fiftiesCount = item.fifties
            stashVC.hundredsCount = item.hundreds
            stashVC.tensCount = item.tens
            stashVC.fivesCount = item.fives
            stashVC.onesCount = item.ones
            stashVC.twentiesCount = item.twenties
            stashVC.totalMoney = item.stashTotal
            self.navigationController?.show(stashVC, sender: self)
    }*/
    

}
