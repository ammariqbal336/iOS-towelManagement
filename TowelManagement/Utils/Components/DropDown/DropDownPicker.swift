//
//  DropDownPicker.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI

enum DropDownPickerState {
    case top
    case bottom
}

struct DropDownPicker: View {
    @Binding var selection: String?
    @Binding var indexValue: Int?
       var state: DropDownPickerState = .bottom
       var options: [String]
    var maxWidth: CGFloat = .infinity
    var hint: String
       @State var showDropdown = false
       
       @SceneStorage("drop_down_zindex") private var index = 1000.0
       @State var zindex = 1000.0
       
       var body: some View {
           GeometryReader {
               let size = $0.size
               
               VStack(spacing: 0) {
                   
                   
                   if state == .top && showDropdown {
                       OptionsView()
                   }
                   
                   HStack {
                       Text(selection == nil ? hint : selection!)
                           .foregroundColor(selection != nil ? .black : .gray)
                       
                       
                       Spacer(minLength: 0)
                       
                       Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                           .font(.title3)
                           .foregroundColor(.gray)
                           .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                   }
                   .padding(.horizontal, 15)
                   .frame(width: .infinity, height: 50)
                   .background(.white)
                   .contentShape(.rect)
                   .onTapGesture {
                       index += 1
                       zindex = index
                       withAnimation(.snappy) {
                           showDropdown.toggle()
                       }
                   }
                   .zIndex(10)
                   
                   if state == .bottom && showDropdown {
                       OptionsView()
                   }
               }
               .clipped()
               .background(.white)
               .cornerRadius(10)
               .overlay {
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(.gray)
               }
               .frame(height: size.height, alignment: state == .top ? .bottom : .top)
               
           }
           .frame(width: maxWidth, height: 50)
           .zIndex(zindex)
       }
       
       
       func OptionsView() -> some View {
           VStack(spacing: 0) {
               ForEach(options.indices, id: \.self) { i in
                   HStack {
                       Text(options[i])
                       Spacer()
                       Image(systemName: "checkmark")
                           .opacity(selection == options[i] ? 1 : 0)
                   }
                   .foregroundStyle(selection == options[i] ? Color.primary : Color.gray)
                   .animation(.none, value: selection)
                   .frame(height: 40)
                   .contentShape(.rect)
                   .padding(.horizontal, 15)
                   .onTapGesture {
                       withAnimation(.snappy) {
                           selection = options[i]
                           indexValue = i
                           showDropdown.toggle()
                       }
                   }
               }
           }
           .transition(.move(edge: state == .top ? .bottom : .top))
           .zIndex(1)
       }
}

//#Preview {
//    DropDownPicker()
//}
