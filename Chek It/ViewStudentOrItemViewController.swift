//
//  ViewStudentOrItemViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewStudentOrItemViewController: UIViewController {
    var studentToView: Student?
    var itemToView: Item?
    var studentOrItem: String!
   
    @IBOutlet weak var studentOrItemImageView: UIImageView!
    
    @IBOutlet weak var studentOrItemLabel: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        if studentOrItem == "Student" {
            studentOrItemLabel.text = "\(studentToView!.lastName), \(studentToView!.firstName)"
            studentOrItemImageView.image = studentToView!.picture
        } else {
            studentOrItemLabel.text = itemToView!.itemName
            studentOrItemImageView.image = itemToView!.picture
        }
    }
}

extension ViewStudentOrItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentOrItem == "Student" {
            return (studentToView?.transactions.count)!
        } else {
            return (itemToView?.transactionRecord.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath)
        
        return cell
    }
}
