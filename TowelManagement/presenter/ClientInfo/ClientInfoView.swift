//
//  ClientInfoView.swift
//  TowelManagement
//
//  Created by mac on 13/06/2024.
//

import SwiftUI

struct ClientInfoView: View {
    @StateObject var vm : ClientInfoViewModel = ClientInfoViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: ClientInfo? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.clientInfoList) { type in
                        HStack {
                            NavigationLink {
                                EditClientInfoView(clientData: type)
                            }label: {
                                VStack(alignment:.leading) {
                                    Text(type.name ?? "")
                                        .font(.headline)
                                        .bold()
                                    Text(type.client_type?.name ?? "")
                                        .font(.subheadline)
                                    Text("Range \(type.credit_range)")
                                        .font(.subheadline)
                                    Text("Restricted \(type.is_restricted ? "Yes": "No"  )")
                                        .font(.subheadline)
                                       
                                    
                                       
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
                                    
                                }
    
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
                .navigationTitle("Client Info")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddClientInfoView()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}

#Preview {
    ClientInfoView()
}
