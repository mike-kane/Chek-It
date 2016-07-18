//
//  SelectItemOrStudentTableViewCell.swift
//  Chek It
//
//  Created by Mike Kane on 7/17/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class SelectItemOrStudentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemOrStudentImageView: UIImageView!
    
    
    @IBOutlet weak var itemOrStudentNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUpItemCell(item: Item) {
            itemOrStudentNameLabel.text = item.itemName
            itemOrStudentImageView.image = item.picture
    }
    
    func setUpStudentCell(student: Student) {
        itemOrStudentImageView.image = student.picture
        itemOrStudentNameLabel.text = "\(student.lastName), \(student.firstName)"
    }
    

}
