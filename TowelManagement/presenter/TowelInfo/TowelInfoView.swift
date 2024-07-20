//
//  TowelInfoView.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import Foundation
import SwiftUI
struct TowelInfoView : View {
    
    @StateObject var vm : TowelInfoViewModel = TowelInfoViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: TowelInfo? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                CustomButtons(actions: {
                    vm.login(username: "ammar3@gmail.com", password: "123456")
                }, displayText: "Login")
                CustomButtons(actions: {
                    vm.fetchProfile()
                }, displayText: "Fetch Profile")
                List{
                    ForEach(vm.towelInfoList) { info in
                        HStack {
                            NavigationLink {
                                EditTowelInfo(towelData: info)
                            }label: {
                                Text(info.name ?? "")
                                    .font(.headline)
                            }
                            
                        }
                        .swipeActions {
                                     Button {
                                         self.itemToDelete = info
                                         showingDeleteAlert = true
                                     } label: {
                                         Label("Delete", systemImage: "trash")
                                     }
                                 }
                                 .tint(.red)
                        
                    }
                    .alert("Are you sure?\n", isPresented: $showingDeleteAlert, actions: {
                            Button("Delete", role: .destructive, action: {
                                vm.deleteType(itemToDelete)
                            })
                        })
                    
                }
                .navigationTitle("Towel Info")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddTowelInfo()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}
