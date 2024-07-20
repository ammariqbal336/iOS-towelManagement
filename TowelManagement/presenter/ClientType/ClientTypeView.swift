//
//  ClientTypeView.swift
//  TowelManagement
//
//  Created by mac on 12/06/2024.
//

import SwiftUI

struct ClientTypeView: View {
    @StateObject var vm : ClientTypeViewModel = ClientTypeViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: ClientType? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.clientTypeList) { type in
                        HStack {
                            NavigationLink {
                                EditClientTypeView(clientData: type)
                            }label: {
                                VStack(alignment:.leading) {
                                    Text(type.name ?? "")
                                        .font(.headline)
                                        .bold()
                                       
                                    HStack {
                                        Text("Created At")
                                            .font(.subheadline)
                                        Text(type.created_at ?? Date(),style: .date)
                                            .font(.subheadline)
                                    }
                                    HStack {
                                        Text("Updated At")
                                            .font(.subheadline)
                                        Text(type.updated_at ?? Date(),style: .date)
                                            .font(.subheadline)
                                    }
//                                    Text("Updated At: \(type.updated_at ?? "")" )
//                                        .font(.headline)
                                    
                                }
                                //.background(type.isActive == true ? Color.white: Color.gray)
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
                .navigationTitle("Client Type")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddClientTypeView()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}

#Preview {
    ClientTypeView()
}
