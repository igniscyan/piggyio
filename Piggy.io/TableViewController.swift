//
//  TableViewController.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/6/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit
class TableViewController: UITableViewController,  {

    var stashes : [Stash] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createArray() -> [Stash] {
        
    }

}
