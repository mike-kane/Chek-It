//
//  CreateTransactionViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
// 

import UIKit

class CreateTransactionViewController: UIViewController {

    var studentSelected: Student?
    var itemSelected: Item?
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBAction func addItemButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "selectItemSegue", sender: nil)
    }
    
    @IBAction func addStudentButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "SelectStudentSegue", sender: nil)
    }
    
    @IBAction func unwindFromSelectionSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func completeButtonPressed(_ sender: AnyObject) {
        if validateSelections() {
            let successAlert = UIAlertController(title: "Success!", message: "Item has been checked out successfully!", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "OK", style: .default) {
                action in
                    _ = self.navigationController?.popViewController(animated: true)
            }
            successAlert.addAction(successAction)
            
            let newTransaction = Transaction()
            newTransaction.item = itemSelected
            newTransaction.student = studentSelected
            newTransaction.add()
            itemSelected?.update {
                self.itemSelected?.currentlyCheckedOutBy = self.studentSelected
                //self.itemSelected?.allTransactions.append(newTransaction)
            }
            
            present(successAlert, animated: true, completion: nil)
        } else {
            let failureaAlert = UIAlertController(title: "Error!", message: "You must select a student and an item.", preferredStyle: .alert)
            let failureAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            failureaAlert.addAction(failureAction)
            present(failureaAlert, animated: true, completion: nil)
        }
    }
    
    func validateSelections() -> Bool {
        if studentSelected == nil || itemSelected == nil{
            return false
        } else {
            return true
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let studentSelected = studentSelected {
            let studentImage = UIImage(data: studentSelected.picture as Data)
            self.studentImageView.image = studentImage!
            self.studentNameLabel.text = "\(studentSelected.lastName!), \(studentSelected.firstName!)"
        } else {
            studentNameLabel.text = "Select a student"
        }
        
        if let itemSelected = itemSelected {
            let itemImage = UIImage(data: itemSelected.picture as Data)
            itemImageView.image = itemImage!
            itemNameLabel.text = itemSelected.itemName
        } else {
            itemNameLabel.text = "Select an item"
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectStudentSegue" {
            let sourceVC = segue.destination as! SelectStudentViewController
            self.studentSelected = sourceVC.studentSelected
        } else {
            let sourceVC = segue.destination as! SelectItemViewController
            self.itemSelected = sourceVC.itemSelected
        }
    }
}
