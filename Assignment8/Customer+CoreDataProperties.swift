//
//  Customer+CoreDataProperties.swift
//  Assignment8
//
//  Created by Rahul Zore on 4/3/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var id: String?
    @NSManaged public var phone_number: String?

}
