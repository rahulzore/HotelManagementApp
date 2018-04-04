//
//  RoomDetailsViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit
import CoreData

class RoomDetailsViewController: UIViewController {

    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomOccupancy: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    
    var room: Room?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Room Details"
        roomName.text = room?.name
        roomOccupancy.text = room?.occupancy
        roomPrice.text = String(format: "%.2f", (room?.price)!)

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
