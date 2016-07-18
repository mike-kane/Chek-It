//
//  Transaction.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class Transaction: NSObject {
    
    var item: Item!
    var student: Student!
    var dateCheckedOut: NSDate!
    var dateCheckedIn: NSDate?
    var transactionComplete = false

}
