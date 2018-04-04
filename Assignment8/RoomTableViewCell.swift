//
//  RoomTableViewCell.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/4/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomlbl: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
