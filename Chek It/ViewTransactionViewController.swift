//
//  ViewTransactionViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewTransactionViewController: UIViewController {

    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var dateCheckedOutLabel: UILabel!
    
    
    @IBAction func returnedButtonPressed(sender: AnyObject) {
        //Mark transaction as complete.
        //Remove from open transactions list
        //Move to completed transactions list
        //unwind to transactionsVC
        
        performSegueWithIdentifier("unwindToTransactionsVCSegue", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
