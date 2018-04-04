//
//  Booking+CoreDataProperties.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/3/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//
//

import Foundation
import CoreData


extension Booking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booking> {
        return NSFetchRequest<Booking>(entityName: "Booking")
    }

    @NSManaged public var fromDate: Date?
    @NSManaged public var toDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var customer: Customer?
    @NSManaged public var room: Room?

}
