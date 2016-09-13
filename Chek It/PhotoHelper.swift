//
//  PhotoHelper.swift
//  NurseBID
//
//  Created by Mike Kane on 6/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

typealias PhotoHelperCallback = (UIImage?) -> Void

class PhotoHelper: NSObject {
    
    
    //View Controller will be wherever Alert and ImagePicker are presented
    
    weak var viewController: UIViewController!
    var callback: PhotoHelperCallback
    var imagePickerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: @escaping PhotoHelperCallback) {
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        photoSource()
    }
    
    func photoSource() {
        
        let alertController = UIAlertController(title: nil, message: "Please select your photo source", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let photoLibraryAction = UIAlertAction(title: "Photo From Library", style: .default) { (action) in
                self.showImagePickerController(.photoLibrary)
        }
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        
        if UIImagePickerController.isCameraDeviceAvailable(.rear) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .default) { (action) in
                self.showImagePickerController(.camera)
            }
            
            alertController.addAction(cameraAction)
        }
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    
    func showImagePickerController(_ sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController!.delegate = self
        self.viewController.present(imagePickerController!, animated: true, completion: nil)
    }
    
}


extension PhotoHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        viewController.dismiss(animated: false, completion: nil)
        
        callback(image)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}

extension UIImage {
    func resizeWithPercentage(_ percentage: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    func resizeWithWidth(_ width: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }

}
