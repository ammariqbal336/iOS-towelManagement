//
//  LoginReponse.swift
//  TowelManagement
//
//  Created by mac on 20/07/2024.
//

import Foundation

struct LoginReponse : Codable {
    let token: String
    var user: UserResponse
}
