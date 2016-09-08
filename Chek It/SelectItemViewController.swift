//
//  SelectItemViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/17/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class SelectItemViewController: UIViewController {

    var itemSelected: Item!
    
    var allAvailableItems = RealmHelper.objects(Item)?.filter("isCheckedOut = false")
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        
        let nib = UINib(nibName: "EntityNib", bundle: nil)
        itemsTableView.registerNib(nib, forCellReuseIdentifier: "entityCell")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ItemSelectedSegue" {
            let nextVC = segue.destinationViewController as! CreateTransactionViewController
            nextVC.itemSelected = itemSelected
        }
    }
}


extension SelectItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allAvailableItems = allAvailableItems {
            return allAvailableItems.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath) as! EntityTableViewCell
        
        let availableItem = allAvailableItems![indexPath.row]
        cell.setUpItemCell(availableItem, transaction: nil)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        itemSelected = allAvailableItems![indexPath.row]
        performSegueWithIdentifier("ItemSelectedSegue", sender: nil)
    }
}
