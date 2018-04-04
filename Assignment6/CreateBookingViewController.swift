//
//  CreateBookingViewController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class CreateBookingViewController: UIViewController {
    
    @IBOutlet weak var bookingName: UITextField!
    @IBOutlet weak var customerID: UITextField!
    @IBOutlet weak var roomName: UITextField!
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Booking> = Booking.fetchRequest()
        do{
            SingletonController.bookingLog = try PersistenceService.context.fetch(fetchRequest)
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
    @IBAction func datePickChange(_ sender: UIDatePicker) {
        fromDate.minimumDate = Date()
    }
    
    @IBAction func createBooking(_ sender: UIButton) {
        
        if((bookingName.text?.isEmpty)! || (customerID.text?.isEmpty)! || (roomName.text?.isEmpty)!){
            let alert = UIAlertController(title: "Error", message: "All fields are mandatory!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        let bookingName1 = bookingName.text
        let customerID1 = customerID.text
        let roomName1 = roomName.text
        let fDate = fromDate.date
        let tDate = toDate.date
        var customer1 = Customer()
        var room1 = Room()
        
        var custFlag:Bool = false
        for customer in SingletonController.customerArray{
            if(customerID1!==customer.id){
                customer1=customer
                custFlag=true
            }
        }
        if(!custFlag){
            let alert = UIAlertController(title: "Customer", message: "Customer Not Found!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        var roomFlag:Bool = false
        for room in SingletonController.roomArray{
            if(room.name==roomName1){
                room1 = room
                roomFlag=true
            }
        }
        if(!roomFlag){
            let alert = UIAlertController(title: "Room", message: "Room Not Found!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        if(tDate.timeIntervalSince(fDate)<86000){
            let alert = UIAlertController(title: "Dates", message: "Booking should be done atleast for 1 Day!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        for book in SingletonController.bookingLog{
            if(book.room?.name==room1.name){
                if( !((fDate<book.fromDate! && tDate<book.fromDate!) || (fDate>book.toDate! && tDate>book.toDate!)) ){
                    let alert = UIAlertController(title: "Error", message: "Room is already booked for this time period!!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    let alertWindow = UIWindow(frame: UIScreen.main.bounds)
                    alertWindow.rootViewController = UIViewController()
                    alertWindow.windowLevel = UIWindowLevelAlert + 1;
                    alertWindow.makeKeyAndVisible()
                    alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
                    return
                }
                
            }
        }
        
        SingletonController.createBooking(bookingName: bookingName1!, fromDate: fDate, toDate: tDate, customer: customer1, roomName: room1)
        
        
        let alert = UIAlertController(title: "Booking", message: "Booking created Successfully!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
        
        for book in SingletonController.bookingLog{
            print(book.name)
        }
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
