//
//  CompletedTransactionsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/31/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CompletedTransactionsViewController: UIViewController {
    
    let completedTransactions = RealmHelper.objects(Transaction)?.filter("transactionComplete = true")
    
    var transactionSelected: Transaction!
    
    @IBOutlet weak var completedTransactionsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        completedTransactionsTableView.delegate = self
        completedTransactionsTableView.dataSource = self
    }

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewCompletedTransactionSegue" {
            let nextVC = segue.destinationViewController as! ViewCompletedTransactionViewController
            nextVC.transactionToView = self.transactionSelected
        }
    }

}

extension CompletedTransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let completedTransactions = completedTransactions {
            return completedTransactions.count
        } else {
            return 1
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("completedTransactionCell", forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        transactionSelected = completedTransactions![indexPath.row]
        self.performSegueWithIdentifier("viewCompletedTransactionSegue", sender: nil)
    }
}