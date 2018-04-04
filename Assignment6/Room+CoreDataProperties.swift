//
//  Room+CoreDataProperties.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var name: String?
    @NSManaged public var occupancy: String?
    @NSManaged public var price: Double

}
