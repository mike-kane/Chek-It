//
//  Book.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class Book: NSObject {

    var bookName: String!
    var isCheckedOut: Bool = false
    var currentTransaction: Transaction?
    var transactionRecord = [Transaction]()
    
    
}
