//
//  CreateNewStudentViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/17/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import RealmSwift

class CreateNewStudentViewController: UIViewController {

    @IBOutlet weak var newStudentImageView: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var photoHelper: PhotoHelper?
    
    @IBAction func addStudentPhotoButtonPressed(_ sender: AnyObject) {
        photoHelper = PhotoHelper(viewController: self) { (image: UIImage?) in
            if let image = image {
                self.newStudentImageView.image = image
            }
        }
    }
    
    @IBAction func createStudentButtonPressed(_ sender: AnyObject) {
        
        if validateInputs() {
            // All inputs are valid.  Create student object and save to Realm DB
            
            // Create success alert controller.  Pop navigation view on acknowledgment
            let successAlert = UIAlertController(title: "Success!", message: "Student has been saved.", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                self.navigationController?.popViewController(animated: true)
            })
            successAlert.addAction(successAction)
            
            //Create Student, resize image, add attributes, save to Realm DB
            let newStudent = Student()
            newStudent.firstName = firstNameTextField.text
            newStudent.lastName = lastNameTextField.text
            let scaledImage = newStudentImageView.image?.resizeWithWidth(150)
            let imageAsData = UIImagePNGRepresentation(scaledImage!)
            newStudent.picture = imageAsData
            newStudent.add()
            
            present(successAlert, animated: true, completion: nil)
            
        } else {
            
            // One or more errors.  Create failure alert and present to user.  Does not pop VC from Nav Stack
            let failureAlert = UIAlertController(title: "Error!", message: "All students must have a picture, first name, and last name.", preferredStyle: .alert)
            let failureAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            failureAlert.addAction(failureAction)
            // One or more inputs is not valid; present error message
            present(failureAlert, animated: true, completion: nil)
        }
    }
    
    func validateInputs() -> Bool {
        if firstNameTextField.text == nil || (firstNameTextField.text?.isEmpty)! {
            return false
        }
        
        if lastNameTextField.text == nil || (lastNameTextField.text?.isEmpty)! {
            return false
        }
        
        if newStudentImageView.image == nil {
            return false
        }
        
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
