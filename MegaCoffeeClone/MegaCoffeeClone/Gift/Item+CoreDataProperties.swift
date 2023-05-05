//
//  Item+CoreDataProperties.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/19.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: Int32
    @NSManaged public var price: Int32
    @NSManaged public var total: Int32
}

extension Item : Identifiable {

}
