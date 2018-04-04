//
//  CreateRoomViewController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createRoom(_ sender: UIButton) {
        if((roomName.text?.isEmpty)! || (roomOccupancy.text?.isEmpty)! || (roomPrice.text?.isEmpty)!){
            let alert = UIAlertController(title: "Error", message: "All fields are mandatory!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindowLevelAlert + 1;
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
            return
        }
        
        
        SingletonController.createRoom(name: roomName.text!, occupancy: roomOccupancy.text!, price: Double(roomPrice.text!)!)
        
        let alert = UIAlertController(title: "Room", message: "Room Added Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
        
        for room in SingletonController.roomArray{
            print(room.name)
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
