//
//  EntityTableViewCell.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class EntityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var entityImageView: UIImageView!

    @IBOutlet weak var entityNameLabel: UILabel!
    
    @IBOutlet weak var dateCheckedOutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpItemCell(_ item: Item, transaction: Transaction?) {
        entityImageView.image = UIImage(data: item.picture as Data)
        entityNameLabel.text = item.itemName
        
        if let transaction = transaction {
            dateCheckedOutLabel.text = transaction.dateCheckedOut
            if transaction.transactionComplete == true {
                let color = UIColor(red: 66/255, green: 244/255, blue: 113/255, alpha: 0.5)
                self.backgroundColor = color
            } else {
                let color = UIColor(red: 244/255, green: 89/255, blue: 66/255, alpha: 0.5)
                self.backgroundColor = color
            }
        } else {
            dateCheckedOutLabel.text = ""
        }
        
    }
    
    func setUpStudentCell(_ student: Student, transaction: Transaction?) {
        entityImageView.image = UIImage(data: student.picture as Data)
        entityNameLabel.text = "\(student.lastName!), \(student.firstName!)"
        
        if let transaction = transaction {
            dateCheckedOutLabel.text = "Checked Out: \(transaction.dateCheckedOut)"
            if transaction.transactionComplete == true {
                let color = UIColor(red: 66/255, green: 244/255, blue: 113/255, alpha: 0.5)
                self.backgroundColor = color
            } else {
                let color = UIColor(red: 244/255, green: 89/255, blue: 66/255, alpha: 0.5)
                self.backgroundColor = color
            }
        } else {
            dateCheckedOutLabel.text = ""
        }
    }

}
