//
//  AddCustomerViewController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController {

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
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
            let alert = UIAlertController(title: "Error", message: "Phone Number should be 10 digit numeric value!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        if(!validatePassport(value: id.text!)){
            let alert = UIAlertController(title: "Error", message: "Id field should be a valid Licence or Passport Number!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        if((name.text!.isEmpty) || (address.text!.isEmpty) || (id.text!.isEmpty) || (phonenumber.text!.isEmpty)){
            let alert = UIAlertController(title: "Error", message: "All fields are mandatory!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        SingletonController.addCustomer(name: name.text!, address: address.text!, id: id.text!, phonenumber: phonenumber.text!)
        for cust in SingletonController.customerArray{
            print(cust.name)
        }
        
        let alert = UIAlertController(title: "Customer", message: "Customer Added Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alert, animated: true, completion: nil)

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
