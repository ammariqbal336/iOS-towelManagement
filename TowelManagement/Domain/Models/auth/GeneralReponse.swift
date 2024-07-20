//
//  GeneralReponse.swift
//  TowelManagement
//
//  Created by mac on 20/07/2024.
//

import Foundation

struct GeneralReponse<T: Codable> : Codable {
    let status: Bool
    //let message: String
    let data: T?
}
