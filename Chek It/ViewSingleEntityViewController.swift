//
//  ViewSingleEntityViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift

class ViewSingleEntityViewController: UIViewController {
    var studentToView: Student?
    var itemToView: Item?
    var studentOrItem: String!
    //var studentHistory: Results<T>{
      //  return []
    //}
   
    @IBOutlet weak var studentOrItemImageView: UIImageView!
    
    @IBOutlet weak var studentOrItemLabel: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "EntityNib", bundle: nil)
        historyTableView.register(nib, forCellReuseIdentifier: "entityCell")
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        if studentOrItem == "Student" {
            studentOrItemLabel.text = "\(studentToView!.lastName), \(studentToView!.firstName)"
            let image: UIImage = UIImage(data: studentToView!.picture! as Data)!
            studentOrItemImageView.image = image
        } else {
            studentOrItemLabel.text = itemToView!.itemName
            let image: UIImage = UIImage(data: itemToView!.picture! as Data)!
            studentOrItemImageView.image = image
        }
    }
}

extension ViewSingleEntityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentOrItem == "Student" {
            return 5
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath) as! EntityTableViewCell
        
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
