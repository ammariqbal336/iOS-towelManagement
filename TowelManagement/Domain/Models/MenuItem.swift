//
//  MenuItem.swift
//  TowelManagement
//
//  Created by mac on 04/06/2024.
//

import Foundation

struct MenuItem : Identifiable{
    let id : Int?
    var name: String = ""
    var icon: String = ""
}
extension MenuItem {
    
   static var list: [MenuItem] = [
        MenuItem ( id: 1, name: "Towel Type", icon: ""),
        MenuItem ( id: 2, name: "Towel Size", icon: ""),
        MenuItem ( id: 3, name: "Towel Info", icon: ""),
        MenuItem ( id: 4, name: "Towel Rate", icon: ""),
        MenuItem ( id: 5, name: "Client Type", icon: ""),
        MenuItem ( id: 6, name: "Client Info", icon: ""),
        MenuItem ( id: 7, name: "Transaction Screen", icon: ""),
       
    
    ]
}
