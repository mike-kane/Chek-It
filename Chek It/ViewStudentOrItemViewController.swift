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
            let image: UIImage = UIImage(data: studentToView!.picture!)!
            studentOrItemImageView.image = image
        } else {
            studentOrItemLabel.text = itemToView!.itemName
            let image: UIImage = UIImage(data: itemToView!.picture!)!
            studentOrItemImageView.image = image
        }
    }
}

extension ViewStudentOrItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentOrItem == "Student" {
            return studentToView!.transactionHistory.count
        } else {
            return (itemToView?.allTransactions.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath)
        
        return cell
    }
}
