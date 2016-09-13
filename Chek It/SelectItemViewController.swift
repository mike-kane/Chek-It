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
        itemsTableView.register(nib, forCellReuseIdentifier: "entityCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemSelectedSegue" {
            let nextVC = segue.destination as! CreateTransactionViewController
            nextVC.itemSelected = itemSelected
        }
    }
}


extension SelectItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allAvailableItems = allAvailableItems {
            return allAvailableItems.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath) as! EntityTableViewCell
        
        let availableItem = allAvailableItems![(indexPath as NSIndexPath).row]
        cell.setUpItemCell(availableItem, transaction: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected = allAvailableItems![(indexPath as NSIndexPath).row]
        performSegue(withIdentifier: "ItemSelectedSegue", sender: nil)
    }
}
