//
//  TowelInfoRepoImpl.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation
import CoreData
class TowelInfoRepoImpl : TowelInfoRepo {

    let coreData = CoreDataManager.coreDataManager
    //@Inject var localDataSource: any LocalDataSourceProtocol
    
    func getTowelInfo() -> Result<[TowelInfo], NetworkError> {
        let request = NSFetchRequest<TowelInfo>(entityName: "TowelInfo")
        //var data = ItemFetchable().fetchEntities(coreData: coreData, entityName: "TowelInfo", context: coreData.context, predicate: nil, sortDescriptors: nil)
       // return .success([])
//        do {
//            var data = localDataSource.addEntity(entityName: "TowelInfo", attributes: request)
//            return .success(data)
//        }catch let error {
//            return .failure(.FetchError)
//        }
        
        do {
            var towelInfoList = try coreData.context.fetch(request)
            return .success(towelInfoList)
        }
        catch let error {
            //print("Fetch error \(error)")
            return .failure(.FetchError)
        }
    }
    
    
}
