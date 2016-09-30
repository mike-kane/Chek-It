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
        let formatter = DateFormatter()
        let date = Date()
        formatter.dateStyle = DateFormatter.Style.short
        return formatter.string(from: date)
    }
    dynamic var dateCheckedIn: Date?
    dynamic var transactionComplete = false
}
