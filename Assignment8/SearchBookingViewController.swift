//
//  SearchBookingViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class SearchBookingViewController: UIViewController {

    @IBOutlet weak var searchByID: UITextField!
    @IBOutlet weak var searchByDate: UIDatePicker!
    @IBOutlet weak var searchResultTextView: UITextView!
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
    
    @IBAction func idButton(_ sender: UIButton) {
        let id = searchByID.text
        searchResultTextView.text=""
        if(id==nil || (id?.isEmpty)!){
            self.throwAlert(reason: "All fields are mandatory!!")
            return
        }
        
        var flag: Bool = false
        var textToDisplay: String = ""
        for booking in SingletonController.bookingLog{
            if(booking.customer?.id==id){
                textToDisplay = "Booking Name: \(booking.name)\nFrom Date:\(booking.fromDate)\nTo Date:\(booking.toDate)\nCustomer Name:\(booking.customer?.name)\nRoom Name:\(booking.room?.name)"
                print(textToDisplay)
                flag = true
            }
            else{
                flag = false
            }
        }
        if(flag){
            searchResultTextView.text = textToDisplay
        } else {
            self.throwAlert(reason: "Booking not found for given ID")
        }
        
    }
    @IBAction func dateButton(_ sender: UIButton) {
        
        searchResultTextView.text=""
        var flag:Bool = false
        for booking in SingletonController.bookingLog{
            //let dateComparisionResult:ComparisonResult = booking.fromDate.compare(searchByDate.date)
            let order = NSCalendar.current.compare(booking.fromDate! as Date, to: searchByDate.date, toGranularity: .day)
            if(order == .orderedSame){
                print("Found!!")
                flag=true
                searchResultTextView.text = "Booking Name: \(String(describing: booking.name))\nFrom Date:\(String(describing: booking.fromDate))\nTo Date:\(String(describing: booking.toDate))\nCustomer Name:\(String(describing: booking.customer?.name))\nRoom Name:\(String(describing: booking.room?.name))"
            }
        }
        
        if(!flag) {
            self.throwAlert(reason: "Booking not found for given Date")
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
    
    func throwAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management App", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

}


