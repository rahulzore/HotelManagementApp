//
//  BookingDetailsViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController {

    @IBOutlet weak var bookingName: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var fromDate: UILabel!
    @IBOutlet weak var toDate: UILabel!
    
    var booking: Booking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.title = "Booking Details"
        bookingName.text = booking?.name
        customerName.text = booking?.customer?.name
        roomName.text = booking?.room?.name
        fromDate.text = booking?.fromDate?.toString(dateFormat: "yyyy/MMM/dd HH:mm:ss")
        toDate.text = booking?.toDate?.toString(dateFormat: "yyyy/MMM/dd HH:mm:ss")
        // Do any additional setup after loading the view.
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

}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
