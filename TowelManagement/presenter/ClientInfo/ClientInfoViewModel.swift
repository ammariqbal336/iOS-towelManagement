//
//  ClientInfoViewModel.swift
//  TowelManagement
//
//  Created by mac on 13/06/2024.
//

import Foundation
import CoreData
class ClientInfoViewModel : ObservableObject {
    let coreData = CoreDataManager.coreDataManager
    @Published var clientInfoList: [ClientInfo] = []
    @Published var clientTypeList: [ClientType] = []
    @Published var clientType: Int = -1
    init(){
        
        getClientInfo()
        getClientType()
    }
    
    func getClientInfo(){
        let request = NSFetchRequest<ClientInfo>(entityName: "ClientInfo")
        do {
            clientInfoList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
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
    
    func addType(name : String,range: String,isRestricted: Bool){
        let sizeItem = ClientInfo(context: coreData.context)
        sizeItem.name = name
        sizeItem.id = UUID()
        sizeItem.credit_range = Double(range) ?? 0.0
        sizeItem.is_restricted = isRestricted
        sizeItem.created_at = Date()
        sizeItem.updated_at = Date()
        if(clientType != -1){
            sizeItem.client_type = clientTypeList[clientType]
        }
        coreData.save()
        clientInfoList = []
        getClientInfo()
    }
    
    func updateSize(type: ClientInfo){
        let sizeItem = type
       // sizeItem.name = name
        sizeItem.updated_at = Date()
        if(clientType != -1){
            sizeItem.client_type = clientTypeList[clientType]
        }
        coreData.save()
        clientInfoList = []
        getClientInfo()
    }
    
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getClientInfo()
    }
}
