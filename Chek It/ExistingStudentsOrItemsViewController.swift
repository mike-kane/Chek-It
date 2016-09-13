//
//  ExistingStudentsOrItemsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift

class ExistingStudentsOrItemsViewController: UIViewController {
    var allExistingStudents = RealmHelper.objects(Student)
    var allExistingItems = RealmHelper.objects(Item)
    var selectedIndex = 0
    var studentSelected: Student?
    var itemSelected: Item?
   
    @IBOutlet weak var itemsOrStudentsSegmentedControl: UISegmentedControl!
   
    @IBOutlet weak var entityTableView: UITableView!
    
    @IBAction func segmentedControlChoiceChanged(_ sender: AnyObject) {
        if itemsOrStudentsSegmentedControl.selectedSegmentIndex != selectedIndex {
            selectedIndex = itemsOrStudentsSegmentedControl.selectedSegmentIndex
            entityTableView.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        if itemsOrStudentsSegmentedControl.selectedSegmentIndex == 0 { // Item Selected
            performSegue(withIdentifier: "createNewItemSegue", sender: nil)
        } else { // Student Selected
            performSegue(withIdentifier: "createNewStudentSegue", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        entityTableView.reloadData()
        print("break!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsOrStudentsSegmentedControl.selectedSegmentIndex = 0
        entityTableView.delegate = self
        entityTableView.dataSource = self
        
        let nib = UINib(nibName: "EntityNib", bundle: nil)
        entityTableView.register(nib, forCellReuseIdentifier: "entityCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewStudentOrItemSegue" {
            
            let nextVC = segue.destination as! ViewSingleEntityViewController
            nextVC.studentToView = studentSelected
            nextVC.itemToView = itemSelected
           
            if self.selectedIndex == 0 {
                nextVC.studentOrItem = "Item"
            } else {
                nextVC.studentOrItem = "Student"
            }
        }
    }

}

extension ExistingStudentsOrItemsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 0 {//Items selected
            return allExistingItems?.count ?? 0
        } else {
             return allExistingStudents?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath) as! EntityTableViewCell
        
        if selectedIndex == 0 {                                     // Items selected
            if let allExistingItems = allExistingItems {
                let item  = allExistingItems[(indexPath as NSIndexPath).row]
                cell.setUpItemCell(item, transaction: nil)
                cell.dateCheckedOutLabel.text = ""
            }
        } else {                                                    // Students selected
            if let allExistingStudents = allExistingStudents {
                let student = allExistingStudents[(indexPath as NSIndexPath).row]
                cell.setUpStudentCell(student, transaction: nil)
                cell.dateCheckedOutLabel.text = ""
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == 0 {
            if let allExistingItems = allExistingItems {
                itemSelected = allExistingItems[(indexPath as NSIndexPath).row]
            }
        } else {
            if let allExistingStudents = allExistingStudents {
                studentSelected = allExistingStudents[(indexPath as NSIndexPath).row]
            }
        }
        
        performSegue(withIdentifier: "viewStudentOrItemSegue", sender: nil)
    }
    
}
