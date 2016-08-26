//
//  CurrentTransactionsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//
//  TODO:
//

import UIKit
import RealmSwift

class CurrentTransactionsViewController: UIViewController {

    // TODO:  Get all open transactions
    //        Get items attached to transactions
    //        Display items
    var currentTransactions = RealmHelper.objects(Transaction)?.filter("transactionComplete = false")
    
    @IBOutlet weak var transactionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TransactionCell", bundle: nil)
        transactionsTableView.registerNib(nib, forCellReuseIdentifier: "TransactionCell")
        
        // Do any additional setup after loading the view.
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        
    }

  
    @IBAction func unwindToTransactionsSegue(segue: UIStoryboardSegue) {
        
    }

   

}

extension CurrentTransactionsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currentTransactions = currentTransactions {
            return currentTransactions.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("openTransactionCell", forIndexPath: indexPath) as! TransactionTableViewCell
        
        if let currentTransactions = currentTransactions {
            let transaction = currentTransactions[indexPath.row]
            let student = transaction.student
            let item = transaction.item
            let itemImage  = UIImage(data: item.picture)
            cell.itemImageView.image = itemImage!
            cell.itemNameLabel.text = item.itemName
            let studentImage = UIImage(data: student.picture)
            cell.studentImageView.image = studentImage!
            cell.studentNameLabel.text = "\(student.lastName), \(student.firstName)"
        }
        
        return cell
    }
    
}
