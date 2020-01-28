//
//  Type+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Sabbir Hossain on 1/28/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//
//

import Foundation
import CoreData


extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type")
    }

    @NSManaged public var carType: String?
    @NSManaged public var name: String?
    @NSManaged public var devices: NSSet?

}

// MARK: Generated accessors for devices
extension Type {

    @objc(addDevicesObject:)
    @NSManaged public func addToDevices(_ value: Subtype)

    @objc(removeDevicesObject:)
    @NSManaged public func removeFromDevices(_ value: Subtype)

    @objc(addDevices:)
    @NSManaged public func addToDevices(_ values: NSSet)

    @objc(removeDevices:)
    @NSManaged public func removeFromDevices(_ values: NSSet)

}
