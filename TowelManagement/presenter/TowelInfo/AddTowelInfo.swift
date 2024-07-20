//
//  AddTowelInfo.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import Foundation
import SwiftUI

struct AddTowelInfo: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelInfoViewModel
    @State var typeTextField: String = ""
    var body: some View {
        NavigationView {
            VStack() {
                
                Text("Add Towel Info")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Towel Info", text: $typeTextField)
                 
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
