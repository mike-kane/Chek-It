//
//  CheckedOutItemsViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/1/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CheckedOutItemsViewController: UIViewController {

    var currentTransactions = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func unwindToTransactionsSegue(segue: UIStoryboardSegue) {
        
    }

   

}

extension CheckedOutItemsViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentTransactions.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("transactionCell", forIndexPath: indexPath)
        
        return cell
    }
    
}
