//
//  CreateBookingViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
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

    @IBAction func datePickChange(_ sender: UIDatePicker) {
        fromDate.minimumDate = Date()
    }
    
    
    @IBAction func createBooking(_ sender: UIButton) {
        
        
        if((bookingName.text?.isEmpty)! || (customerID.text?.isEmpty)! || (roomName.text?.isEmpty)!){
            self.throwAlert(reason: "All fields are mandatory!!")
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
            self.throwAlert(reason: "Customer Not Found!!")
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
            self.throwAlert(reason: "Room Not Found!!")
            return
        }
        
        if(tDate.timeIntervalSince(fDate)<86000){
           self.throwAlert(reason: "Booking should be done atleast for 1 Day!!")
            return
        }
        
        for book in SingletonController.bookingLog{
            if(book.room?.name==room1.name){
                if( !((fDate<book.fromDate! && tDate<book.fromDate!) || (fDate>book.toDate! && tDate>book.toDate!)) ){
                    self.throwAlert(reason: "Room is already booked for this time period!!")
                    return
                }
                
            }
        }
        
        SingletonController.createBooking(bookingName: bookingName1!, fromDate: fDate, toDate: tDate, customer: customer1, roomName: room1)
        
        
       self.throwAlert(reason: "Booking created Successfully!!")
        
        for book in SingletonController.bookingLog{
            print(book.name)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
