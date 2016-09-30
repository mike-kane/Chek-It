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
    dynamic var ID = UUID().uuidString
    dynamic var firstName: String!
    dynamic var lastName: String!
    dynamic var picture: Data!
    var transactionHistory = List<Transaction>()
}
