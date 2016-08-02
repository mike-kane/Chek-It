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
        //TODO: Create Photo Helper
        photoHelper = PhotoHelper(viewController: self) { (image: UIImage?) in
            if let image = image {
               self.itemImageView.image = image
            }
        }
        
    }
    
    func alertHelper(title: String, message: String, shouldDismiss: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let alertAction: UIAlertAction
        if shouldDismiss {
             alertAction = UIAlertAction(title: "OK", style: .Default) { (alert: UIAlertAction) in
                self.dismissViewControllerAnimated(true, completion: nil)
                }
        } else {
            alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        }
        
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func createItemButtonPressed(sender: AnyObject) {
        var itemNameError: Bool = false
        var itemPictureError: Bool = false
        var alertTitle: String = ""
        var alertMessage: String = ""
        guard let itemName = itemNameTextField.text where itemNameTextField.text != "" else {
            //TODO:  Present alert with error message
            itemNameError = true
            return
        }
        
        guard let itemImage = itemImageView.image else {
            //TODO:  Create label to act as a warning!
            itemPictureError = true
            return
        }
        
        
        
        if itemPictureError == false || itemNameError == false {
            
            let image = itemImage.resizeWithWidth(150)
            let imageData = UIImagePNGRepresentation(image!)
            
            let newItem = Item()
            newItem.itemName = itemName
            newItem.picture = imageData
            newItem.add()
            alertTitle = "Success!"
            alertMessage = "Item Created Successfully!"
            alertHelper(alertTitle, message: alertMessage, shouldDismiss: true)
        } else {
            if itemNameError == true && itemPictureError == true { //both fields missing
                alertTitle = "Missing Info"
                alertMessage = "New item must have a name and picture!"
            } else if itemNameError == true && itemPictureError == false {  //name field missing
                alertTitle = "Missing Name"
                alertMessage = "New item must have a name!"
            } else {
                alertTitle = "Missing Picture"
                alertMessage = "New item must have a picture!"
            }
            alertHelper(alertTitle, message: alertMessage, shouldDismiss: false)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


   

}
