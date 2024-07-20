//
//  LocalDataSource.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation
import CoreData
//class LocalDataSource : LocalDataSourceProtocol{
//    
//    let coreData = CoreDataManager.coreDataManager
//
//    func fetchEntities( entityName: String, context: NSManagedObjectContext, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]) -> Result<[FetchableType?], NetworkError>   {
//        let request = NSFetchRequest<FetchableType>(entityName: String(describing: FetchableType.self))
//              request.predicate = predicate
//              request.sortDescriptors = sortDescriptors
//              
//              do {
//                  return try .success(coreData.context.fetch(request))
//              } catch {
//                  print("Failed to fetch entities: \(error)")
//                  return .failure(.FetchError)
//              }
//    }
//    
//    func addEntity(entityName: String, attributes: NSManagedObject) -> Result<Void, Error> {
//        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: coreData.context) else {
//            return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Entity not found"]))
//        }
//        do {
//            try coreData.context.save()
//            return .success(())
//        } catch {
//            return .failure(error)
//        }
//    }
//    
//   
//    
//    
//}
