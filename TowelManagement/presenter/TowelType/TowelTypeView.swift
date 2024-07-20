//
//  TowelTypeView.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

struct TowelTypeView: View {
    @StateObject var vm : TowelTypeViewModel = TowelTypeViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: Type? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.towelTypeList) { type in
                        HStack {
                            NavigationLink {
                                EditTowelType(typeData: type)
                            }label: {
                                Text(type.name ?? "")
                                    .font(.headline)
                            }
                            
                        }
                        .swipeActions {
                                     Button {
                                         self.itemToDelete = type
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
                .navigationTitle("Towel Type")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddTowelType()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}



