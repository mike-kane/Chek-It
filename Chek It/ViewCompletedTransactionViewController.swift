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
        itemImageView.image = UIImage(data: item.picture as Data)
        studentImageView.image = UIImage(data: student.picture as Data)
        studentNameLabel.text = "\(student.lastName), \(student.firstName)"
        itemNameLabel.text = item.itemName
        dateCheckedOutLabel.text = "Checked Out:\(completedTransactionToView.dateCheckedOut)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let returnDateString = dateFormatter.string(from: completedTransactionToView.dateCheckedIn! as Date)
        dateReturnedLabel.text = "Returned: \(returnDateString)"
    }

 

}
