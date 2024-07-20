//
//  TransactionBillViewModel.swift
//  TowelManagement
//
//  Created by mac on 22/06/2024.
//
import Foundation
import CoreData

class TransactionBillViewModel : ObservableObject {
    let coreData = CoreDataManager.coreDataManager
    @Published var clientInfoList: [ClientInfo] = []
    @Published var rateInfoList: [Rate] = []
    @Published var transBillHeader: [TransBillHeader] = []
    init(){
        
        getClientInfo()
        getBillInfo()
        getRateInfo()
    }

    func getBillInfo(){
        let request = NSFetchRequest<TransBillHeader>(entityName: "TransBillHeader")
        do {
            transBillHeader = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
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
    
    func getRateInfo(){
        let request = NSFetchRequest<Rate>(entityName: "Rate")
        do {
            rateInfoList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
  
    func addType(name : String,range: String,isRestricted: Bool){
        let sizeItem = TransBillHeader(context: coreData.context)
        //sizeItem.name = name
        sizeItem.id = UUID()
      //  sizeItem.credit_range = Double(range) ?? 0.0
    //    sizeItem.is_restricted = isRestricted
        sizeItem.created_at = Date()
        sizeItem.updated_at = Date()
      
        coreData.save()
        transBillHeader = []
        getBillInfo()
    }
    
    func updateSize(type: TransBillHeader){
        let sizeItem = type
       // sizeItem.name = name
        sizeItem.updated_at = Date()
      
        coreData.save()
        transBillHeader = []
        getBillInfo()
    }
    
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getBillInfo()
    }
}
