//
//  ExistingStudentsOrItemsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ExistingStudentsOrItemsViewController: UIViewController {

    var allExistingStudents = RealmHelper.objects(Student)
    var allExistingItems = RealmHelper.objects(Item)
    var selectedIndex = 0
    var studentSelected: Student?
    var itemSelected: Item?
   
    @IBOutlet weak var itemsOrStudentsSegmentedControl: UISegmentedControl!
   
    @IBOutlet weak var entityTableView: UITableView!
    
    @IBAction func segmentedControlChoiceChanged(sender: AnyObject) {
        if itemsOrStudentsSegmentedControl.selectedSegmentIndex != selectedIndex {
            selectedIndex = itemsOrStudentsSegmentedControl.selectedSegmentIndex
            entityTableView.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        if itemsOrStudentsSegmentedControl.selectedSegmentIndex == 0 { // Item Selected
            performSegueWithIdentifier("createNewItemSegue", sender: nil)
        } else { // Student Selected
            performSegueWithIdentifier("createNewStudentSegue", sender: nil)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        entityTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsOrStudentsSegmentedControl.selectedSegmentIndex = 0
        entityTableView.delegate = self
        entityTableView.dataSource = self
        
        let nib = UINib(nibName: "ExistingStudentOrItemNib", bundle: nil)
        entityTableView.registerNib(nib, forCellReuseIdentifier: "entityCell")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewStudentOrItemSegue" {
            
            let nextVC = segue.destinationViewController as! ViewStudentOrItemViewController
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 0 {//Items selected
            return allExistingItems?.count ?? 0
        } else {
             return allExistingStudents?.count ?? 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath) as! ExistingStudentOrItemTableViewCell
        
        if selectedIndex == 0 {                                     // Items selected
            if let allExistingItems = allExistingItems {
                let item  = allExistingItems[indexPath.row]
                cell.setUpItemCell(item)
            }
        } else {                                                    // Students selected
            if let allExistingStudents = allExistingStudents {
                let student = allExistingStudents[indexPath.row]
                cell.setUpStudentCell(student)
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if selectedIndex == 0 {
            if let allExistingItems = allExistingItems {
                itemSelected = allExistingItems[indexPath.row]
            }
        } else {
            if let allExistingStudents = allExistingStudents {
                studentSelected = allExistingStudents[indexPath.row]
            }
        }
        
        performSegueWithIdentifier("viewStudentOrItemSegue", sender: nil)
    }
    
}
