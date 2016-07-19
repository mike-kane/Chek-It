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

    
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    @IBOutlet weak var itemNameTextField: UITextField!
    
    
    @IBAction func imageButtonTapped(sender: AnyObject) {
        //TODO: Create Photo Helper
        print("add image button pressed!")
    }
    
    
    @IBAction func createItemButtonPressed(sender: AnyObject) {
        print("item created!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


   

}
