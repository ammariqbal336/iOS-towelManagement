//
//  EditTowelSize.swift
//  TowelManagement
//
//  Created by mac on 04/06/2024.
//

import SwiftUI

struct EditTowelSize: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelSizeViewModel
    
    var sizeData : Size
    
    @State var typeTextField: String = ""
    
    var body: some View {
        NavigationView {
           
            VStack(spacing: 10) {
                
                Text("Edit Towel Size")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Towel Size", text: $typeTextField)
                
                CustomButtons(actions: {
                    
                    vm.updateSize(name: typeTextField, size: sizeData)
                    self.presentation.wrappedValue.dismiss()
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
        }
        
    }
}
