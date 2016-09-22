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
    var currentTransactions = RealmHelper.objects(Transaction.self)?.filter("transactionComplete = false")
    
    @IBOutlet weak var transactionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TransactionCellNib", bundle: nil)
        transactionsTableView.register(nib, forCellReuseIdentifier: "TransactionCell")
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transactionsTableView.reloadData()
    }

  
    @IBAction func unwindToTransactionsSegue(_ segue: UIStoryboardSegue) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewTransactionSegue" {
            let nextVC = segue.destination as! ViewTransactionViewController
            nextVC.transactionToView = transactionSelected
        }
    }

}

extension CurrentTransactionsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTransactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        
        if let currentTransactions = currentTransactions {
            let transaction = currentTransactions[(indexPath as NSIndexPath).row]
            let student = transaction.student!
            let item = transaction.item!
            let itemImage  = UIImage(data: item.picture)
            cell.itemImageView.image = itemImage!
            cell.itemNameLabel.text = item.itemName
            let studentImage = UIImage(data: student.picture)
            cell.studentImageView.image = studentImage!
            cell.studentNameLabel.text = "\(student.lastName!), \(student.firstName!)"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transactionSelected = currentTransactions![(indexPath as NSIndexPath).row]
        performSegue(withIdentifier: "viewTransactionSegue", sender: nil)
    }
}
