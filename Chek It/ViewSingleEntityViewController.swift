//
//  ViewSingleEntityViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewSingleEntityViewController: UIViewController {
    var studentToView: Student?
    var itemToView: Item?
    var studentOrItem: String!
   
    @IBOutlet weak var studentOrItemImageView: UIImageView!
    
    @IBOutlet weak var studentOrItemLabel: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "EntityNib", bundle: nil)
        historyTableView.registerNib(nib, forCellReuseIdentifier: "entityCell")
        
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

extension ViewSingleEntityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentOrItem == "Student" {
            return 5
        } else {
            return 5
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath) as! EntityTableViewCell
        
        if studentOrItem == "Student" {
            
            //let transaction: Transaction? = studentHistory[indexPath.row]
            cell.setUpStudentCell(studentToView!, transaction: nil)
        } else {
            //let itemHistory = itemToView!.allTransactions
            cell.setUpItemCell(itemToView!, transaction: nil)
        }
        
        return cell
    }
}
