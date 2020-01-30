//
//  Type+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Sabbir Hossain on 1/29/20.
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
    @NSManaged public var helper: NSSet?

}

// MARK: Generated accessors for helper
extension Type {

    @objc(addHelperObject:)
    @NSManaged public func addToHelper(_ value: Subtype)

    @objc(removeHelperObject:)
    @NSManaged public func removeFromHelper(_ value: Subtype)

    @objc(addHelper:)
    @NSManaged public func addToHelper(_ values: NSSet)

    @objc(removeHelper:)
    @NSManaged public func removeFromHelper(_ values: NSSet)

}
