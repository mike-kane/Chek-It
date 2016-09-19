//
//  CompletedTransactionsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/31/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CompletedTransactionsViewController: UIViewController {
    
    let completedTransactions = RealmHelper.objects(Transaction.self)?.filter("transactionComplete = true")
    
    var transactionSelected: Transaction!
    
    @IBOutlet weak var completedTransactionsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "TransactionCellNib", bundle: nil)
        completedTransactionsTableView.register(nib, forCellReuseIdentifier: "TransactionCell")
        completedTransactionsTableView.delegate = self
        completedTransactionsTableView.dataSource = self
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewCompletedTransactionSegue" {
            let nextVC = segue.destination as! ViewCompletedTransactionViewController
            nextVC.completedTransactionToView = self.transactionSelected
        }
    }

}

extension CompletedTransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let completedTransactions = completedTransactions {
            return completedTransactions.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        
        if let completedTransactions = completedTransactions {
            let transaction = completedTransactions[(indexPath as NSIndexPath).row]
            let student = transaction.student!
            let item = transaction.item!
            let itemImage  = UIImage(data: item.picture)
            cell.itemImageView.image = itemImage!
            cell.itemNameLabel.text = "\(item.itemName)"
            let studentImage = UIImage(data: student.picture)
            cell.studentImageView.image = studentImage!
            cell.studentNameLabel.text = "\(student.lastName), \(student.firstName)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transactionSelected = completedTransactions![(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: "viewCompletedTransactionSegue", sender: nil)
    }
}
