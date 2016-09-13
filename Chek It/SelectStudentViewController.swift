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
        let nib = UINib(nibName: "EntityNib", bundle: nil)
        studentsTableView.register(nib, forCellReuseIdentifier: "entityCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentSelectedSegue" {
            let nextVC = segue.destination as! CreateTransactionViewController
            nextVC.studentSelected = self.studentSelected
        }
    }
}

extension SelectStudentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allStudents = allStudents {
            return allStudents.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath) as! EntityTableViewCell
        
        let availableStudent = allStudents![(indexPath as NSIndexPath).row]
        
        cell.setUpStudentCell(availableStudent, transaction: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentSelected = allStudents![(indexPath as NSIndexPath).row]
        performSegue(withIdentifier: "StudentSelectedSegue", sender: nil)
    }
}
