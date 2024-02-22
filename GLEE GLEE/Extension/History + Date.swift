//
//  History + Date.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 22/2/24.
//

import Foundation
import CoreData

@objc(HistoryDate)
public class HistoryDate: NSManagedObject {

}


extension HistoryDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoryDate> {
        return NSFetchRequest<HistoryDate>(entityName: "HistoryDate")
    }

    @NSManaged public var date: String?
    @NSManaged public var hisotryOfDate: NSSet?

}

// MARK: Generated accessors for hisotryOfDate
//extension HistoryDate {
//
//    @objc(addHisotryOfDateObject:)
//    @NSManaged public func addToHisotryOfDate(_ value: History)
//
//    @objc(removeHisotryOfDateObject:)
//    @NSManaged public func removeFromHisotryOfDate(_ value: History)
//
//    @objc(addHisotryOfDate:)
//    @NSManaged public func addToHisotryOfDate(_ values: NSSet)
//
//    @objc(removeHisotryOfDate:)
//    @NSManaged public func removeFromHisotryOfDate(_ values: NSSet)
//
//}

extension HistoryDate : Identifiable {

}
