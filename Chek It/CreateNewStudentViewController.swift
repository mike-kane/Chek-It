//
//  CreateNewStudentViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/17/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CreateNewStudentViewController: UIViewController {

    @IBOutlet weak var newStudentImageView: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var photoHelper: PhotoHelper?
    
    @IBAction func addStudentPhotoButtonPressed(sender: AnyObject) {
        photoHelper = PhotoHelper(viewController: self) { (image: UIImage?) in
            if let image = image {
                self.newStudentImageView.image = image
            }
        }
    }
    
    @IBAction func createStudentButtonPressed(sender: AnyObject) {
        
        if newStudentImageView.image == nil && (firstNameTextField.text == nil || lastNameTextField.text == nil) {
            
        }
        
        //PRAGMA:  Logic for successful student creation
        let newStudent = Student()
        newStudent.firstName = firstNameTextField.text
        newStudent.lastName = lastNameTextField.text
        let imageData: NSData = UIImagePNGRepresentation(newStudentImageView.image!)!
        newStudent.picture = imageData
        
        newStudent.add()
        let alert = UIAlertController(title: "Success!", message: "Student created!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
                self.navigationController?.popViewControllerAnimated(true)
        })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
