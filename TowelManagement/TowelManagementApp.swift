//
//  TowelManagementApp.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

@main
struct TowelManagementApp: App {
    var container = CoreDataManager.coreDataManager
    
    init(){
        @Provider var towelInfoRepo = TowelInfoRepoImpl() as TowelInfoRepo
       // @Provider var localDataSource = LocalDataSource() as LocalDataSourceProtocol
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
