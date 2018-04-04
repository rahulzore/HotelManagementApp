//
//  Booking+CoreDataProperties.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//
//

import Foundation
import CoreData


extension Booking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booking> {
        return NSFetchRequest<Booking>(entityName: "Booking")
    }

    @NSManaged public var name: String?
    @NSManaged public var fromDate: Date?
    @NSManaged public var toDate: Date?
    @NSManaged public var customer: Customer?
    @NSManaged public var room: Room?

}
