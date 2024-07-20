//
//  AddTowelType.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

struct AddTowelType: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelTypeViewModel
    @State var typeTextField: String = ""
    var body: some View {
        NavigationView {
            VStack() {
                
                Text("Add Towel Type")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Towel Type", text: $typeTextField)
                 
                CustomButtons(actions: {
                    
                    vm.addType(name: typeTextField)
                    self.presentation.wrappedValue.dismiss()
                    //.presentationMode.wrappedValue.dismiss()
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
        }
        
    }
}

#Preview {
    AddTowelType()
}
