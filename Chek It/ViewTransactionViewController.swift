//
//  ViewTransactionViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewTransactionViewController: UIViewController {
    
    var transactionToView: Transaction!
    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var dateCheckedOutLabel: UILabel!
    
    
    @IBAction func returnedButtonPressed(_ sender: AnyObject) {
        
        //Mark transaction as complete.
        //Remove from open transactions list
        //Move to completed transactions list
        //unwind to transactionsVC
        transactionToView.update {
            self.transactionToView.transactionComplete = true
            self.transactionToView.dateCheckedIn = Date()
            self.transactionToView.item?.currentlyCheckedOutBy = nil
        }
        performSegue(withIdentifier: "unwindToTransactionsVCSegue", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let student = transactionToView.student!
        let item = transactionToView.item!
        let studentImage = UIImage(data: student.picture as Data)
        let itemImage = UIImage(data: item.picture as Data)
        studentImageView.image = studentImage!
        itemImageView.image = itemImage!
        studentNameLabel.text = "\(student.lastName!), \(student.firstName!)"
        itemNameLabel.text = item.itemName
        dateCheckedOutLabel.text = "\(transactionToView.dateCheckedOut)"
    }

}
