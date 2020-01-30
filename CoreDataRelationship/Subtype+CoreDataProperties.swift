//
//  Subtype+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Sabbir Hossain on 1/29/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//
//

import Foundation
import CoreData


extension Subtype {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subtype> {
        return NSFetchRequest<Subtype>(entityName: "Subtype")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var owner: Type?

}
