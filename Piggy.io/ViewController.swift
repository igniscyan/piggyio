//
//  ViewController.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/23/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stash = [Stash]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<Stash> = Stash.fetchRequest()
        // Do any additional setup after loading the view.
        do {
        let stash = try PersistenceService.context.fetch(fetchRequest)
            self.stash = stash
            self.tableView.reloadData()
        }   catch {print("Error fetching context")}
    }
    
    @IBAction func onPlusTapped() {
        let alert = UIAlertController(title: "Add Stash", message: nil , preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Amount"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "1s"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let amount = alert.textFields!.last!.text!
            print(name)
            print(amount)
            let stashContext = Stash(context: PersistenceService.context)
            stashContext.stashName = name
            stashContext.stashTotal = Int32(amount)!
            PersistenceService.saveContext()
            self.stash.append(stashContext)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
    
}
