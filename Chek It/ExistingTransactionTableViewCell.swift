//
//  ExistingTransactionTableViewCell.swift
//  Chek It
//
//  Created by Mike Kane on 8/25/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ExistingTransactionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var stuentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
