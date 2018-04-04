//
//  SearchBookingViewController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/4/18.
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
            let alert = UIAlertController(title: "Error", message: "All fields are mandatory!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
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
            let alert = UIAlertController(title: "Not Found!", message: "Booking not found for given ID", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
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
            let alert = UIAlertController(title: "Not Found!", message: "Booking not found for given Date", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
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
