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
        
        let successAlert = UIAlertController(title: "Success!", message: "Item has been saved.", preferredStyle: .Alert)
        let successAction = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
            self.navigationController?.popViewControllerAnimated(true)
        })
        successAlert.addAction(successAction)
        let failureAlert = UIAlertController(title: "Error!", message: "All items must have a picture and a name", preferredStyle: .Alert)
        let failureAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        failureAlert.addAction(failureAction)
        
        let image = itemImageView.image
        let itemName = itemNameTextField.text
        
        
        if image != nil && itemName != nil {
            // Image and item name both exist.  Save to realm and present success message!
            let newItem = Item()
            newItem.itemName = itemName!
            let scaledImage = image?.resizeWithWidth(150)
            let imageAsData: NSData = UIImagePNGRepresentation(scaledImage!)!
            newItem.picture = imageAsData
            newItem.add()
            presentViewController(successAlert, animated: true, completion: nil)
        } else {
            //User is missing image or item name.  Present failure alert action.
            presentViewController(failureAlert, animated: true, completion: nil)
            }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


