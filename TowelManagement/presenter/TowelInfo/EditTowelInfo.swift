//
//  EditTowelInfo.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import Foundation
import SwiftUI

struct EditTowelInfo: View {
    @Environment(\.presentationMode) var presentation

    @EnvironmentObject var vm: TowelInfoViewModel
    
    var towelData : TowelInfo
    
    @State var typeTextField: String = ""
    
    var body: some View {
        NavigationView {
           
            VStack(spacing: 10) {
                
                Text("Edit Towel Info")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    
                   
                CustomTextField(hint: "Towel Info", text: $typeTextField)
                    
                CustomButtons(actions: {
                    
                    vm.updateSize(name: typeTextField, info: towelData)
                    self.presentation.wrappedValue.dismiss()
                }, displayText: "Submit")
                
                Spacer()
                
            }.padding()
        }
        
    }
}
