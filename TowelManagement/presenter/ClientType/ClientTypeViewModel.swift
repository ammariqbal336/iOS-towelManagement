//
//  ClientTypeViewModel.swift
//  TowelManagement
//
//  Created by mac on 12/06/2024.
//

import Foundation
import CoreData
class ClientTypeViewModel : ObservableObject {
    let coreData = CoreDataManager.coreDataManager
    @Published var clientTypeList: [ClientType] = []
    
    init(){
        
        getClientType()
    }
    
    func getClientType(){
        let request = NSFetchRequest<ClientType>(entityName: "ClientType")
        do {
            clientTypeList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
    
    func addType(name : String){
        let sizeItem = ClientType(context: coreData.context)
        sizeItem.name = name
        sizeItem.id = UUID()
        sizeItem.created_at = Date()
        sizeItem.updated_at = Date()
        coreData.save()
        clientTypeList = []
        getClientType()
    }
    
    func updateSize(name : String,type: ClientType){
        let sizeItem = type
        sizeItem.name = name
        sizeItem.updated_at = Date()
        coreData.save()
        clientTypeList = []
        getClientType()
    }
    
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getClientType()
    }
}
