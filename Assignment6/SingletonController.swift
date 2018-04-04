//
//  SingletonController.swift
//  Assignment6
//
//  Created by Rahul Zore on 3/1/18.
//  Copyright © 2018 Rahul Zore. All rights reserved.
//

import UIKit

class SingletonController: NSObject {

//    static var customer = Customer()
//    static var room = Room()
//    static var booking = Booking()
    
    
    // Arrays
    // create array of type customer to store all customers
    static var customerArray: [Customer] = []
    static var roomArray: [Room] = []
    static var bookingLog: [Booking] = []
    
    class func addCustomer(name:String, address:String, id:String, phonenumber:String){
        let customer = Customer(context: PersistenceService.context)
        customer.name=name
        customer.address=address
        customer.id=id
        customer.phone_number=phonenumber
        PersistenceService.saveContext()
        customerArray.append(customer)
    }
    
    class func createRoom(name:String, occupancy:String, price:Double){
        let room = Room(context: PersistenceService.context)
        room.name=name
        room.occupancy=occupancy
        room.price=price
        PersistenceService.saveContext()
        roomArray.append(room)
    }
    
    class func displayCustomers(){
        
    }
    
    class func displayRooms(){
        
    }
    class func createBooking(bookingName:String, fromDate:Date, toDate:Date, customer:Customer, roomName:Room){
        let booking = Booking(context: PersistenceService.context)
        booking.name=bookingName
        booking.customer=customer
        booking.room=roomName
        booking.fromDate=fromDate
        booking.toDate=toDate
        PersistenceService.saveContext()
        bookingLog.append(booking)

    }
    
    
    
    
}
