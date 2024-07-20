//
//  TowelSizeView.swift
//  TowelManagement
//
//  Created by mac on 04/06/2024.
//

import SwiftUI
struct TowelSizeView : View {
    
    @StateObject var vm : TowelSizeViewModel = TowelSizeViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: Size? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.towelSizeList) { type in
                        HStack {
                            NavigationLink {
                                EditTowelSize(sizeData: type)
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
                .navigationTitle("Towel Size")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddTowelSize()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}
