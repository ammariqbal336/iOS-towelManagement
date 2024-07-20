//
//  TowelInfoRepo.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation

protocol TowelInfoRepo {
    func getTowelInfo()  -> Result<[TowelInfo],NetworkError>
}
