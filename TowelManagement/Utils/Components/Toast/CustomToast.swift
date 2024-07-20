//
//  CustomToast.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import SwiftUI


struct CustomToast: View {
    @State private var showToast = false

       var body: some View{
           VStack{

               Button("Show Toast"){
                    showAlert.toggle()
               }
           }
           .toast(isPresenting: $showToast){

               // `.alert` is the default displayMode
               AlertToast(type: .regular, title: "Message Sent!")
               
               //Choose .hud to toast alert from the top of the screen
               //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
           }
       }
}

#Preview {
    CustomToast()
}
