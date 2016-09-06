//
//  ViewCompletedTransactionViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/31/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewCompletedTransactionViewController: UIViewController {
    
    var completedTransactionToView: Transaction!
    var item: Item!
    var student: Student!

    @IBOutlet weak var itemImageView: UIImageView!
   
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var dateCheckedOutLabel: UILabel!
    
    @IBOutlet weak var dateReturnedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        item = completedTransactionToView.item
        student = completedTransactionToView.student
        itemImageView.image = UIImage(data: item.picture)
        studentImageView.image = UIImage(data: student.picture)
        studentNameLabel.text = "\(student.lastName), \(student.firstName)"
        itemNameLabel.text = item.itemName
        dateCheckedOutLabel.text = "Checked Out:\(completedTransactionToView.dateCheckedOut)"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let returnDateString = dateFormatter.stringFromDate(completedTransactionToView.dateCheckedIn!)
        dateReturnedLabel.text = "Returned: \(returnDateString)"
    }

 

}
