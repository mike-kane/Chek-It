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
    
    var allAvailableItems = [Item]()
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        
        //TODO: Populate allAvailableItems using db query
    }


}


extension SelectItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAvailableItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! SelectItemOrStudentTableViewCell
        
        let availableItem = allAvailableItems[indexPath.row]
        cell.setUpItemCell(availableItem)
        
        return cell
    }
}
