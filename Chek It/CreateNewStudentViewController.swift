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
   
    
    @IBAction func addStudentPhotoButtonPressed(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func createStudentButtonPressed(sender: AnyObject) {
        let newStudent = Student()
        newStudent.firstName = firstNameTextField.text
        newStudent.lastName = lastNameTextField.text
        let imageData: NSData = UIImagePNGRepresentation(newStudentImageView.image!)!
        newStudent.picture = imageData
        
        newStudent.add()
        let alert = UIAlertController(title: "Success!", message: "Student created!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
                self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        alert.addAction(action)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
