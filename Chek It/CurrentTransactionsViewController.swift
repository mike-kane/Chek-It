//
//  CurrentTransactionsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.

import UIKit
import RealmSwift

class CurrentTransactionsViewController: UIViewController {
    
    var transactionSelected: Transaction!
    var currentTransactions = RealmHelper.objects(Transaction)?.filter("transactionComplete = false")
    
    @IBOutlet weak var transactionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TransactionCellNib", bundle: nil)
        transactionsTableView.registerNib(nib, forCellReuseIdentifier: "TransactionCell")
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        transactionsTableView.reloadData()
    }

  
    @IBAction func unwindToTransactionsSegue(segue: UIStoryboardSegue) {
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewTransactionSegue" {
            let nextVC = segue.destinationViewController as! ViewTransactionViewController
            nextVC.transactionToView = transactionSelected
        }
    }

}

extension CurrentTransactionsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTransactions?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TransactionCell", forIndexPath: indexPath) as! TransactionTableViewCell
        
        if let currentTransactions = currentTransactions {
            let transaction = currentTransactions[indexPath.row]
            let student = transaction.student!
            let item = transaction.item!
            let itemImage  = UIImage(data: item.picture)
            cell.itemImageView.image = itemImage!
            cell.itemNameLabel.text = item.itemName
            let studentImage = UIImage(data: student.picture)
            cell.studentImageView.image = studentImage!
            cell.studentNameLabel.text = "\(student.lastName), \(student.firstName)"
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        transactionSelected = currentTransactions![indexPath.row]
        performSegueWithIdentifier("viewTransactionSegue", sender: nil)
    }
}
