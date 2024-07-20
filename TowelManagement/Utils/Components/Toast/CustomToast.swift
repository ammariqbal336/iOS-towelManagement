//
//  CustomToast.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import SwiftUI


struct CustomToast: View {
    
    let toast: ToastModel
    @Binding var show: Bool
    
       var body: some View{
           VStack{
               Spacer()
               HStack {
                   Image(systemName: toast.image)
                   Text(toast.title)
               }
               .font(.headline)
               .foregroundColor(.primary)
               .padding(.vertical,20)
               .padding(.horizontal,40)
               .background(.gray.opacity(0.4),in:Capsule())
               
           }
           .frame(width: UIScreen.main.bounds.width / 1.25)
           .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
           .onTapGesture {
               withAnimation{
                   self.show = false
               }
           }
           .onAppear{
               DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                   withAnimation{
                       self.show = false
                   }
               }
           }
       }
    
    
}

