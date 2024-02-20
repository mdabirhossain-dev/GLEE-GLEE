//
//  CoreDataManager.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppCoreData")
        let storeURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("AppCoreData.sqlite")
        
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeURL)]
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        })
        
        return container
    }()
    
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving Support
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

protocol CoreDataManagedObject {
    static var entityName: String { get }
}

extension NSManagedObject: CoreDataManagedObject {
    static var entityName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension CoreDataManager {
    func create<T: NSManagedObject>(_ objectType: T.Type) -> T? {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: T.entityName, in: context) else {
            return nil
        }
        return T(entity: entityDescription, insertInto: context)
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let request = NSFetchRequest<T>(entityName: T.entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch data: \(error)")
            return []
        }
    }
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
    func update<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil) {
        T.setValue("", forKey: "x")
        return
    }
    
    func updateContinueWatchingVideo(video: Video ,_ playingDuration: Float, _ videoDuration: Float,_ videoID: String) {
        let predicate = NSPredicate(format: "videoID == %@", videoID)
        let data = fetch(ContinueWatching.self, predicate: predicate)
        if data.isEmpty {
            if let continueData = CoreDataManager.shared.create(ContinueWatching.self) {
                
                continueData.videoID = video.videoID
                continueData.playingDuration = playingDuration
                continueData.videoDuration = videoDuration
                continueData.thumbnailURL = video.thumbnailURL
                continueData.videoURL = video.videoURL
                continueData.videoTitle = video.name
                CoreDataManager.shared.saveContext()
            }
        }else {
            data.first?.playingDuration = playingDuration
        }
        saveContext()
    }
}

extension CoreDataManager {
    
    func isNewDateForSaveNewHistory() -> Bool{
        let historyDate = fetch(HistoryDate.self)
        for date in historyDate {
            if date.date == Date().format(format: "d MMMM") {
                return false
            }
        }
        return true
    }
}
