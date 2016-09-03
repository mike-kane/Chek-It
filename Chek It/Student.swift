//
//  Student.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift

class Student: Object {

    dynamic var firstName: String!
    dynamic var lastName: String!
    dynamic var picture: NSData!
    var transactionHistory = LinkingObjects(fromType: Student.self, property: "student").filter("transactionComplete = true")
    var openTransactions = LinkingObjects(fromType: Student.self, property: "student").filter("transactionComplete = false")
}
