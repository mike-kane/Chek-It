//
//  Book.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift


class Item: Object {
    dynamic var ID = UUID().uuidString
    dynamic var itemName: String!
    dynamic var isCheckedOut: Bool = false
    dynamic var picture: Data!
    var currentlyCheckedOutBy: Student?
    var transactionHistory = List<Transaction>()
}
