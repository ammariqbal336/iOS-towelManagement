//
//  AddTransactionBillView.swift
//  TowelManagement
//
//  Created by mac on 22/06/2024.
//

import SwiftUI

struct AddTransactionBillView: View {
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var vm: TransactionBillViewModel
    var body: some View {
        NavigationView {
            VStack {
                DropDownView(data: vm.clientInfoList.map { $0.name ?? "" }, hint: "Select Customer")
                CustomButtons(actions: {
                    
                }, displayText: "Add Item")
                
                
                TransItemView(rateData: vm.rateInfoList)
                
//                List(vm.rateInfoList) { rate in
//                    VStack(alignment: .leading) {
//                       
//                        Text(rate.towel_size?.name ?? "")
//                        Text(rate.towel_info?.name ?? "")
//                        Text("\(rate.rate)")
//                    }
//                
//                    
//                    
//                }
                
            }.padding()
        }
    }
}

struct TransItemView: View {
    
     var rateData : [Rate]
    @State var itemSelect = -1
    var body: some View {
        HStack {
            DropDownView(data: rateData.map { "\($0.towel_size?.name ?? "") \($0.towel_info?.name ?? "") \($0.towel_type?.name ?? "")  "  }, hint: "Select Item")
                .onPreferenceChange(TextPreference.self) { value in
                            itemSelect = value
                 }
            if(itemSelect != -1){
                Text("\(rateData[itemSelect].rate)")
            }
            else {
                Text("0.0")
            }
        }
    }
}

//#Preview {
//    AddTransactionBillView()
//}
