//
//  SelectStudentViewController.swift
//  Chek It
//
//  Created by Mike Kane on 7/17/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class SelectStudentViewController: UIViewController {
    
    
    var allStudents = RealmHelper.objects(Student)
    var studentSelected: Student!
    
    
    @IBOutlet weak var studentsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        let nib = UINib(nibName: "ItemOrStudentCellNib", bundle: nil)
        studentsTableView.registerNib(nib, forCellReuseIdentifier: "studentCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StudentSelectedSegue" {
            let nextVC = segue.destinationViewController as! CreateTransactionViewController
            nextVC.studentSelected = self.studentSelected
        }
    }
    
    
}

extension SelectStudentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allStudents = allStudents {
            return allStudents.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath) as! EntityTableViewCell
        
        let availableStudent = allStudents![indexPath.row]
        
        cell.setUpStudentCell(availableStudent, transaction: nil)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        studentSelected = allStudents![indexPath.row]
        performSegueWithIdentifier("StudentSelectedSegue", sender: nil)
    }
}
