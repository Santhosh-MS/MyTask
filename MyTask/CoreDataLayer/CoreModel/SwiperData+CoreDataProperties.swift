//
//  SwiperData+CoreDataProperties.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import CoreData


extension SwiperData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SwiperData> {
        return NSFetchRequest<SwiperData>(entityName: "SwiperData")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?

}
