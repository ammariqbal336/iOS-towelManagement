//
//  TowelRateViewModel.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import CoreData
import Foundation
class TowelRateViewModel : ObservableObject {
    
    let coreData = CoreDataManager.coreDataManager
    @Published var towelRateList: [Rate] = []
    @Published var towelInfoList: [TowelInfo] = []
    @Published var towelTypeList: [Type] = []
    @Published var towelSizeList: [Size] = []
    
    init(){
        getTowelInfo()
        getTowelSize()
        getTowelType()
        getTowelRate()
    }
    
    func getTowelRate(){
        let request = NSFetchRequest<Rate>(entityName: "Rate")
        do {
            towelRateList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
    
    func addType(towelIdIndex: Int,towelTypeIndex: Int,towelSizeIndex: Int,rate : String,fromDate: Date,isActive: Bool){
        let rateItem = Rate(context: coreData.context)
        rateItem.towel_info = towelInfoList[towelIdIndex]
        rateItem.towel_size = towelSizeList[towelSizeIndex]
        rateItem.towel_type = towelTypeList[towelTypeIndex]
        rateItem.rate = !rate.isEmpty ? Double(rate)! : 0.0
        rateItem.from_date = fromDate
        rateItem.is_active = isActive
        rateItem.id = UUID()
        rateItem.created_at = Date()
        rateItem.updated_at = Date()
        coreData.save()
        towelRateList = []
        getTowelRate()
    }
    
    func updateSize(rate : String, rateData: Rate){
        let rateItem = rateData
        rateItem.updated_at = Date()
        rateItem.rate = !rate.isEmpty ? Double(rate)! : 0.0
        coreData.save()
        towelRateList = []
        getTowelRate()
    }
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getTowelRate()
    }
    
    
    func getTowelInfo(){
        let request = NSFetchRequest<TowelInfo>(entityName: "TowelInfo")
        do {
            towelInfoList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
    
    func getTowelSize(){
        let request = NSFetchRequest<Size>(entityName: "Size")
        do {
            towelSizeList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
    
    func getTowelType(){
        let request = NSFetchRequest<Type>(entityName: "Type")
        do {
            towelTypeList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
}
