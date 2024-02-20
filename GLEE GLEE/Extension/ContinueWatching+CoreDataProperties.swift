//
//  ContinueWatching+CoreDataProperties.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import Foundation
import CoreData


extension ContinueWatching {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContinueWatching> {
        return NSFetchRequest<ContinueWatching>(entityName: "ContinueWatching")
    }

    @NSManaged public var playingDuration: Float
    @NSManaged public var thumbnailURL: String?
    @NSManaged public var videoDuration: Float
    @NSManaged public var videoID: String?
    @NSManaged public var videoTitle: String?
    @NSManaged public var videoURL: String?

}

extension ContinueWatching : Identifiable {

}
