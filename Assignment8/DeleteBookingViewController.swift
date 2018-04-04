//
//  DeleteBookingViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit

class DeleteBookingViewController: UIViewController {

    @IBOutlet weak var bookingName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteBooking(_ sender: UIButton) {
        
        if(bookingName.text?.isEmpty)!{
            self.throwAlert(reason: "Please enter booking name before deleting!!")
            return
        }
        var bookingFlag:Bool = false
        var i:Int = 0
        for book in SingletonController.bookingLog{
            let context = PersistenceService.context
            if(book.name==bookingName.text){
                bookingFlag=true
                SingletonController.bookingLog.remove(at: i)
                context.delete(book)
            }
            i=i+1
        }
        
        if(bookingFlag){
            self.throwAlert(reason: "Booking deleted successfully!!")
        }
        else{
            self.throwAlert(reason: "Booking not found!!")
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
