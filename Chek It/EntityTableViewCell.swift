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

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpItemCell(item: Item, transaction: Transaction?) {
        entityImageView.image = UIImage(data: item.picture)
        entityNameLabel.text = item.itemName
        
        if let transaction = transaction {
            dateCheckedOutLabel.text = transaction.dateCheckedOut 
        }
        
    }
    
    func setUpStudentCell(student: Student) {
        entityImageView.image = UIImage(data: student.picture)
        entityNameLabel.text = "\(student.lastName), \(student.firstName)"
    }

}
