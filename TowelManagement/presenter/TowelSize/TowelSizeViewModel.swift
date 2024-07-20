//
//  TowelSizeViewModel.swift
//  TowelManagement
//
//  Created by mac on 04/06/2024.
//

import Foundation
import CoreData

class TowelSizeViewModel : ObservableObject {
    
    let coreData = CoreDataManager.coreDataManager
    @Published var towelSizeList: [Size] = []
    
    init(){
        
        getTowelSize()
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
    
    func addType(name : String){
        let sizeItem = Size(context: coreData.context)
        sizeItem.name = name
        sizeItem.id = UUID()
        sizeItem.created_at = Date()
        sizeItem.updated_at = Date()
        coreData.save()
        towelSizeList = []
        getTowelSize()
    }
    
    func updateSize(name : String,size: Size){
        let sizeItem = size
        sizeItem.name = name
        sizeItem.updated_at = Date()
        coreData.save()
        towelSizeList = []
        getTowelSize()
    }
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getTowelSize()
    }
    
    
}
