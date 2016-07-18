//
//  Book.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class Item: NSObject {

    var itemName: String!
    var isCheckedOut: Bool = false
    var picture: UIImage!
    var currentTransaction: Transaction?
    var transactionRecord = [Transaction]()
    
    
}
