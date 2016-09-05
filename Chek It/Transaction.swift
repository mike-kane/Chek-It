//
//  Transaction.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift

class Transaction: Object {
    
    dynamic var item: Item?
    dynamic var student: Student?
    dynamic var dateCheckedOut: String {
        let formatter = NSDateFormatter()
        let date = NSDate()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        return formatter.stringFromDate(date)
    }
    dynamic var dateCheckedIn: NSDate?
    dynamic var transactionComplete = false

    
}
