//
//  AddClientInfoView.swift
//  TowelManagement
//
//  Created by mac on 13/06/2024.
//

import SwiftUI

struct AddClientInfoView: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: ClientInfoViewModel
    @State var typeTextField: String = ""
    @State var rangeTextField: String = ""
    @State var isActive: Bool = false
    @State var toastMessage: String = ""
    @State var showToast = false
    var body: some View {
        NavigationView {
            VStack() {
                
                Text("Add Client Info")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Client Name", text: $typeTextField)
                
                DropDownView(data: vm.clientTypeList.map{ $0.name ?? "" },hint: "Select Type")
                    .onPreferenceChange(TextPreference.self) { value in
                                vm.clientType = value
                     }
                    
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                if (vm.clientType != -1  && vm.clientTypeList[vm.clientType].name == "Credit") {
                    
                    CustomTextField(hint: "Client Range", text: $rangeTextField)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    CustomCheckBox(isOn: $isActive, label: "Allow Credit after range limit")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }
                
               
                 
                CustomButtons(actions: {
                    
                    if(typeTextField.isEmpty ){
                        toastMessage = "Enter Client Name"
                       showToast = true
                        return
                    }
                    else if( vm.clientType == -1 ){
                        toastMessage = "Select Type"
                       showToast = true
                        return
                    }
                    else if( vm.clientTypeList[vm.clientType].name == "Credit" && rangeTextField.isEmpty ){
                        toastMessage = "Enter Credit Range"
                       showToast = true
                        return
                    }
                    
                    else {
                        vm.addType(name: typeTextField,range: rangeTextField,isRestricted: isActive)
                        self.presentation.wrappedValue.dismiss()
                    }
                
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
                .overlay(overlayView: CustomToast(toast: ToastModel(image: "alert", title: toastMessage), show: $showToast), show: $showToast)
        }
        
    }
}

#Preview {
    AddClientInfoView()
}
