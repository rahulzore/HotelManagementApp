//
//  CustomerDetailsViewController.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {

    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var idlbl: UILabel!
    @IBOutlet weak var phonenumberlbl: UILabel!
    
    var Customer: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Customer Details"
        self.navigationItem.backBarButtonItem?.title = "Back"
        namelbl.text = Customer?.name
        addresslbl.text = Customer?.address
        idlbl.text = Customer?.id
        phonenumberlbl.text = Customer?.phone_number
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Back(_ sender: UIBarButtonItem) {
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
