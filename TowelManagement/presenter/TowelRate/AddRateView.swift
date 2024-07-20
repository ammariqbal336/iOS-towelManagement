//
//  AddRateView.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI


struct TextPreference: PreferenceKey {
    static var defaultValue = 0
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = nextValue()
    }
}

struct AddRateView: View {
    
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelRateViewModel
    @State var showToast = false
    
    @State private var date = Date()
    @State var typeTextField: String = ""
    @State var towelInfo: Int = -1
    @State var towelSize: Int = -1
    @State var towelType: Int = -1
    @State var isActive: Bool = false
    @State var toastMessage: String = ""
    var body: some View {
        VStack {
            Text("Add Towel Rate")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            CustomDatePicker(date: $date, title: "Select Date")
               .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            DropDownView(data: vm.towelInfoList.map{ $0.name ?? "" },hint: "Select Towel")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelInfo = value
                                }
                
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            
            DropDownView(data: vm.towelTypeList.map{ $0.name ?? "" },hint: "Select Type")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelType = value
                                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            DropDownView(data: vm.towelSizeList.map{ $0.name ?? "" },hint: "Select Size")
                .onPreferenceChange(TextPreference.self) { value in
                                    towelSize = value
                                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
        
            
            
           
            CustomTextField(hint: "Towel Rate", text: $typeTextField,keyboardType: UIKeyboardType.numberPad)
            
            CustomCheckBox(isOn: $isActive,label: "Is Active").padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            
            CustomButtons(actions: {
                if(towelInfo == -1 ){
                    toastMessage = "Select Towel"
                   showToast = true
                    return
                }
                else if(towelType == -1 ){
                    toastMessage = "Select Type"
                   showToast = true
                    return
                }
                else if(towelSize == -1 ){
                    toastMessage = "Select Size"
                   showToast = true
                    return
                }
                
                else if(typeTextField.isEmpty){
                    toastMessage = "Enter Rate"
                   showToast = true
                    return
                }
                
                else    {
                    vm.addType(towelIdIndex: towelInfo, towelTypeIndex: towelType, towelSizeIndex: towelSize, rate: typeTextField, fromDate: date, isActive: isActive)
                    self.presentation.wrappedValue.dismiss()
                }
            }, displayText: "Submit")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .overlay(overlayView: CustomToast(toast: ToastModel(image: "alert", title: toastMessage), show: $showToast), show: $showToast)
            
            
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
       
       
       
      //  DropDownView()
        
    }
}

#Preview {
    AddRateView()
}
