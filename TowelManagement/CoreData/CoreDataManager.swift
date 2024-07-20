//
//  CoreDataManager.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let coreDataManager = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init(){
        container = NSPersistentContainer(name: "TowelManagementData")
        container.loadPersistentStores {(description, error) in
            if let error = error {
                print("Error while loading core data \(error)")
            }
        }
        
        context = container.viewContext
        
        
    }
    
    func save(){
        do{
            try context.save()
        }
        catch let error{
            print("Error while saving...\(error)")
        }
    }
}
