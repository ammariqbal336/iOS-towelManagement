//
//  TransactionBillView.swift
//  TowelManagement
//
//  Created by mac on 22/06/2024.
//

import SwiftUI

struct TransactionBillView: View {
    @StateObject var vm : TransactionBillViewModel = TransactionBillViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: TransBillHeader? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.transBillHeader) { type in
                        HStack {
                            NavigationLink {
                                //EditClientInfoView(clientData: type)
                            }label: {
                                VStack(alignment:.leading) {
                                    Text(type.client_info?.name ?? "")
                                        .font(.headline)
                                        .bold()
                                 
                                    Text("Total Amount \(type.total_amount)")
                                        .font(.subheadline)
                                    Text("Paid Amount \(type.paid_amount)")
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
                .navigationTitle("Transaction Screen")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddTransactionBillView()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}

#Preview {
    TransactionBillView()
}
