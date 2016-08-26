//
//  CheckedOutItemsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//
//  TODO:
//

import UIKit
import RealmSwift

class CheckedOutItemsViewController: UIViewController {

    // TODO:  Get all open transactions
    //        Get items attached to transactions
    //        Display items
    var currentTransactions = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func unwindToTransactionsSegue(segue: UIStoryboardSegue) {
        
    }

   

}

extension CheckedOutItemsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTransactions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("openTransactionCell", forIndexPath: indexPath)
        
        return cell
    }
    
}
