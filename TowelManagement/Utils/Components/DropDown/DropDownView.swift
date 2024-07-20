//
//  DropDownView.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI

struct DropDownView: View {
  //  @State var selection: String? = nil
    var defaultIndex :Int? = -1
    @State var selection1: String? = nil
    @State var index: Int? = nil
    var data: [String]
    var hint: String
    
  //  @Binding var selection: String
        
        var body: some View {
            DropDownPicker(
                    selection: $selection1,
                    indexValue: $index,
                    options:data,
                    hint: hint
                )
            .preference(key: TextPreference.self, value: index ?? -1)
           
        }
}

//#Preview {
//    DropDownView()
//}
