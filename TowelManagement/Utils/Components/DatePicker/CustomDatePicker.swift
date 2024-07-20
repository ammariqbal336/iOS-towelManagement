//
//  CustomDatePicker.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var date: Date
    let title: String
    var displayComponent : DatePicker<Label>.Components? = [.date]
    var body: some View {
        DatePicker(title,
           selection: $date,
           displayedComponents: displayComponent!)
           .pickerStyle(InlinePickerStyle())
    }
}

//#Preview {
//    CustomDatePicker()
//}
