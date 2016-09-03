//
//  CreateTransactionViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
// 
// TODO: Finish this VC!

import UIKit

class CreateTransactionViewController: UIViewController {

    var studentSelected: Student?
    var itemSelected: Item?
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBAction func addItemButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("selectItemSegue", sender: nil)
    }
    
    @IBAction func addStudentButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("SelectStudentSegue", sender: nil)
    }
    
    @IBAction func unwindFromSelectionSegue(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func completeButtonPressed(sender: AnyObject) {
        if validateSelections() {
            let successAlert = UIAlertController(title: "Success!", message: "Item has been checked out successfully!", preferredStyle: .Alert)
            let successAction = UIAlertAction(title: "OK", style: .Default) {
                action in
                    self.navigationController?.popViewControllerAnimated(true)
            }
            successAlert.addAction(successAction)
            
            let newTransaction = Transaction()
            newTransaction.item = itemSelected
            newTransaction.student = studentSelected
            newTransaction.add()
            presentViewController(successAlert, animated: true, completion: nil)
        } else {
            let failureaAlert = UIAlertController(title: "Error!", message: "You must select a student and an item.", preferredStyle: .Alert)
            let failureAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            failureaAlert.addAction(failureAction)
            presentViewController(failureaAlert, animated: true, completion: nil)
        }
    }
    
    func validateSelections() -> Bool {
        if studentSelected == nil || itemSelected == nil{
            return false
        } else {
            return true
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let studentSelected = studentSelected {
            let studentImage = UIImage(data: studentSelected.picture)
            self.studentImageView.image = studentImage!
            self.studentNameLabel.text = "\(studentSelected.lastName), \(studentSelected.firstName)"
        } else {
            studentNameLabel.text = "Select a student"
        }
        
        if let itemSelected = itemSelected {
            let itemImage = UIImage(data: itemSelected.picture)
            itemImageView.image = itemImage!
            itemNameLabel.text = "\(itemSelected.itemName)"
        } else {
            itemNameLabel.text = "Select an item"
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SelectStudentSegue" {
            let sourceVC = segue.destinationViewController as! SelectStudentViewController
            self.studentSelected = sourceVC.studentSelected
        } else {
            let sourceVC = segue.destinationViewController as! SelectItemViewController
            self.itemSelected = sourceVC.itemSelected
        }
    }
}
