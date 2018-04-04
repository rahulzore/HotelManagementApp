//
//  DIsplayCustomerViewController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class DIsplayCustomerViewController: UIViewController {

    @IBOutlet weak var customerList: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest: NSFetchRequest<Customer> = Customer.fetchRequest()
        do{
            SingletonController.customerArray = try PersistenceService.context.fetch(fetchRequest)
        } catch{
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        customerList.text=""
        for customers in SingletonController.customerArray{
            customerList.insertText("Name: \(customers.name!)\nAddress: \(customers.address!)\nID: \(customers.id!)\nPhoneNumber: \(customers.phone_number!)\n\n")
        }
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
