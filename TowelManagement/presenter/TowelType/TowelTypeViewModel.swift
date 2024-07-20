//
//  TowelTypeViewModel.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import Foundation
import CoreData

class TowelTypeViewModel : ObservableObject {
    
    let coreData = CoreDataManager.coreDataManager
    @Published var towelTypeList: [Type] = []
    
    init(){
        
        getTowelType()
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
    
    func addType(name : String){
        let typeItem = Type(context: coreData.context)
        typeItem.name = name
        typeItem.id = UUID()
        typeItem.created_at = Date()
        typeItem.updated_at = Date()
        coreData.save()
        towelTypeList = []
        getTowelType()
    }
    
    func updateType(name : String,type: Type){
        let typeItem = type
        typeItem.name = name
        typeItem.updated_at = Date()
        coreData.save()
        towelTypeList = []
        getTowelType()
    }
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getTowelType()
    }
    
    
}
