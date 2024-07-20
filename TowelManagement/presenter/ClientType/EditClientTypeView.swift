//
//  EditClientTypeView.swift
//  TowelManagement
//
//  Created by mac on 13/06/2024.
//

import SwiftUI

struct EditClientTypeView: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: ClientTypeViewModel
    
    var clientData : ClientType
    
    @State var typeTextField: String = ""
    
    var body: some View {
        NavigationView {
           
            VStack(spacing: 10) {
                
                Text("Edit Client Type")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Client Type", text: $typeTextField)
                    
                CustomButtons(actions: {
                    
                    vm.updateSize(name: typeTextField, type: clientData)
                    self.presentation.wrappedValue.dismiss()
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
        }
        
    }
}

//#Preview {
//    EditClientTypeView()
//}
