//
//  EditRateView.swift
//  TowelManagement
//
//  Created by mac on 12/06/2024.
//

import SwiftUI

struct EditRateView: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelRateViewModel
    @State var showToast = false
    @ObservedObject var rateData : Rate
    
    @State private var date = Date()
    @State var typeTextField: String = ""
    @State var towelInfo: Int = -1
    @State var towelSize: Int = -1
    @State var towelType: Int = -1
    @State var isActive: Bool = false
    @State var toastMessage: String = ""
    var body: some View {
        VStack{
            Text("Edit Towel Rate")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            CustomDatePicker(date: $date, title: "Select Date")
               .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            DropDownView(selection1: rateData.towel_info?.name, data: vm.towelInfoList.map{ $0.name ?? "" },hint: "Select Towel")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelInfo = value
                    if(towelInfo != -1){
                        rateData.towel_info = vm.towelInfoList[towelInfo]
                    }
                }
                
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            
            DropDownView(selection1:rateData.towel_type?.name,data: vm.towelTypeList.map{ $0.name ?? "" },hint: "Select Type")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelType = value
                    if(towelType != -1){
                        rateData.towel_type = vm.towelTypeList[towelType]
                    }
                    
                                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            DropDownView(selection1:rateData.towel_size?.name, data: vm.towelSizeList.map{ $0.name ?? "" },hint: "Select Size")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelSize = value
                    if(towelSize != -1){
                        rateData.towel_size = vm.towelSizeList[towelSize]
                    }
                                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
        
            
            
           
            CustomTextField(hint: "Towel Rate", text: $typeTextField,keyboardType: UIKeyboardType.numberPad)
            
            CustomCheckBox(isOn: $rateData.is_active,label: "Is Active").padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            
            CustomButtons(actions: {
//                if(towelInfo == -1 ){
//                    toastMessage = "Select Towel"
//                   showToast = true
//                    return
//                }
//                else if(towelType == -1 ){
//                    toastMessage = "Select Type"
//                   showToast = true
//                    return
//                }
//                else if(towelSize == -1 ){
//                    toastMessage = "Select Size"
//                   showToast = true
//                    return
//                }
//                
//                else 
                if(typeTextField.isEmpty){
                    toastMessage = "Enter Rate"
                   showToast = true
                    return
                }
                
                else    {
                    vm.updateSize(rate: typeTextField, rateData: rateData )
                    self.presentation.wrappedValue.dismiss()
                }
            }, displayText: "Submit")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .overlay(overlayView: CustomToast(toast: ToastModel(image: "alert", title: toastMessage), show: $showToast), show: $showToast)
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    EditRateView()
//}
