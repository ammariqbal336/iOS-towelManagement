//
//  DataModel.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation
struct DataModel<T: Decodable>{
    var status : Int
    var data: T
}
