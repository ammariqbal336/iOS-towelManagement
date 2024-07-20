//
//  TowelRateView.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI

struct TowelRateView: View {
    @StateObject var vm : TowelRateViewModel = TowelRateViewModel()
    
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: Rate? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {


                List{
                    ForEach(vm.towelRateList) { type in
                        HStack {
                            NavigationLink {
                                EditRateView(rateData: type)
                            }label: {
                                VStack(alignment:.leading) {
                                    Text(type.towel_size?.name ?? "")
                                        .font(.title)
                                        .bold()
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                    
                                    Text("Vendor: \(type.towel_info?.name ?? "")" )
                                        .font(.headline)
                                    Text("Type: \(type.towel_type?.name ?? "")" )
                                        .font(.headline)
                                    
                                    Text("Rate: \(type.rate, specifier: "%.2f")" )
                                        .font(.headline)
                                    
                                    Text("Status: \(type.is_active ? "Active": "InActive")" )
                                        .font(.headline)
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
                .navigationTitle("Towel Rate")
                .navigationBarItems(trailing: addButton)
                .listStyle(.sidebar)
                
                
            }
            
        }
        .environmentObject(vm)
        
    }
    
    var addButton: some View {
        NavigationLink(destination: AddRateView()) {
            HStack {
                Label("Add Item", systemImage: "plus")
                Text("Add Item")
               
            }
        }
    }
}

#Preview {
    TowelRateView()
}
