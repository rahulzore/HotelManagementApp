//
//  CreateRoomViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class CreateRoomViewController: UIViewController {

    @IBOutlet weak var roomName: UITextField!
    @IBOutlet weak var roomOccupancy: UITextField!
    @IBOutlet weak var roomPrice: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        roomPrice.keyboardType = UIKeyboardType.numberPad
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        do{
            SingletonController.roomArray = try PersistenceService.context.fetch(fetchRequest)
        } catch{
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func createRoom(_ sender: UIButton) {
        if((roomName.text?.isEmpty)! || (roomOccupancy.text?.isEmpty)! || (roomPrice.text?.isEmpty)!){
           self.throwAlert(reason: "All fields are mandatory!!")
            return
        }
        
        
        SingletonController.createRoom(name: roomName.text!, occupancy: roomOccupancy.text!, price: Double(roomPrice.text!)!)
        
       self.throwAlert(reason: "Room Added Successfully")
        
        for room in SingletonController.roomArray{
            print(room.name)
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
