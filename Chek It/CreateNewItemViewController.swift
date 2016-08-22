//
//  CreateNewItemViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CreateNewItemViewController: UIViewController {
    
    var newItem: Item!
    var photoHelper: PhotoHelper?
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    @IBOutlet weak var itemNameTextField: UITextField!
    
    
    @IBAction func imageButtonTapped(sender: AnyObject) {
        photoHelper = PhotoHelper(viewController: self) { (image: UIImage?) in
            if let image = image {
               self.itemImageView.image = image
            }
        }
    }
    
    @IBAction func createItemButtonPressed(sender: AnyObject) {
        
        if validateInputs() {
            // Image and item name both exist.  Save to realm and present success message!
            
            let successAlert = UIAlertController(title: "Success!", message: "Item has been saved.", preferredStyle: .Alert)
            let successAction = UIAlertAction(title: "OK", style: .Default, handler: {
                action in
                self.navigationController?.popViewControllerAnimated(true)
            })
            successAlert.addAction(successAction)
            
            //Create item, add attributes, and save to Realm DB
            let newItem = Item()
            newItem.itemName = itemNameTextField.text
            let scaledImage = itemImageView.image?.resizeWithWidth(150)
            let imageAsData: NSData = UIImagePNGRepresentation(scaledImage!)!
            newItem.picture = imageAsData
            newItem.add()
            presentViewController(successAlert, animated: true, completion: nil)
        } else {
            //User is missing image or item name.  Present failure alert action.
            let failureAlert = UIAlertController(title: "Error!", message: "All items must have a picture and a name", preferredStyle: .Alert)
            let failureAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            failureAlert.addAction(failureAction)
            presentViewController(failureAlert, animated: true, completion: nil)
            }
        
    }
    
    func validateInputs() -> Bool {
        
        if itemNameTextField.text == nil || (itemNameTextField.text?.isEmpty)! {
            return false
        }
        
        if itemImageView.image == nil {
            return false
        }
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


