//
//  AddCustomerViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/3/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController {

    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        phonenumber.keyboardType = UIKeyboardType.numberPad
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
    
    @objc func validatePhone(value: String) -> Bool {
        let PHONE_REGEX = "[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    @objc func validatePassport(value: String) -> Bool {
        let PASS_REGEX = "[A-Z][0-9]{7,10}"
        let passTest = NSPredicate(format: "SELF MATCHES %@", PASS_REGEX)
        let result =  passTest.evaluate(with: value)
        return result
    }
    @IBAction func addCustomer(_ sender: UIButton) {
        if(!validatePhone(value: phonenumber.text!)){
            self.throwAlert(reason: "Phone Number should be 10 digit numeric value!")
            return
        }
        
        if(!validatePassport(value: id.text!)){
            self.throwAlert(reason: "Id field should be a valid Licence or Passport Number!!")
            return
        }
        
        if((name.text!.isEmpty) || (address.text!.isEmpty) || (id.text!.isEmpty) || (phonenumber.text!.isEmpty)){
            self.throwAlert(reason: "All fields are mandatory!!")
            return
        }
        SingletonController.addCustomer(name: name.text!, address: address.text!, id: id.text!, phonenumber: phonenumber.text!)
        for cust in SingletonController.customerArray{
            print(cust.name)
        }
        
        self.throwAlert(reason: "Customer Added Successfully")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func throwAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management App", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
