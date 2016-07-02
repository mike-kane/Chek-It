//
//  PhotoHelper.swift
//  NurseBID
//
//  Created by Mike Kane on 6/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

typealias PhotoHelperCallback = UIImage? -> Void

class PhotoHelper: NSObject {
    
    
    //View Controller will be wherever Alert and ImagePicker are presented
    
    weak var viewController: UIViewController!
    var callback: PhotoHelperCallback
    var imagePickerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: PhotoHelperCallback) {
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        photoSource()
    }
    
    func photoSource() {
        
        let alertController = UIAlertController(title: nil, message: "Please select your photo source", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let photoLibraryAction = UIAlertAction(title: "Photo From Library", style: .Default) { (action) in
                self.showImagePickerController(.PhotoLibrary)
        }
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        
        if UIImagePickerController.isCameraDeviceAvailable(.Rear) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default) { (action) in
                self.showImagePickerController(.Camera)
            }
            
            alertController.addAction(cameraAction)
        }
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController!.delegate = self
        self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
}


extension PhotoHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        viewController.dismissViewControllerAnimated(false, completion: nil)
        
        callback(image)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
