//
//  Student.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class Student: NSObject {

    var firstName: String!
    var lastName: String!
    var picture: UIImage!
    var transactions = [Transaction]()
    var currentlyCheckedOutItems = [Item]()
    
    
}
