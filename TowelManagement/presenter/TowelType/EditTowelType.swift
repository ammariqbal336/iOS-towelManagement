//
//  EditTowelType.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

struct EditTowelType: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelTypeViewModel
    
    var typeData : Type
    
    @State var typeTextField: String = ""
    
    var body: some View {
        NavigationView {
           
            VStack(spacing: 10) {
                
                Text("Edit Towel Type")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Towel Type", text: $typeTextField)
                   
                CustomButtons(actions: {
                    
                    vm.updateType(name: typeTextField, type: typeData)
                    self.presentation.wrappedValue.dismiss()
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
        }
        
    }
}

//#Preview {
//    EditTowelType()
//}
