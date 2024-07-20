//
//  CustomCheckBox.swift
//  TowelManagement
//
//  Created by mac on 08/06/2024.
//

import SwiftUI

struct CustomCheckBox: View {
    @Binding var isOn : Bool
    var label: String?

    var body: some View {
        Toggle(label ?? "", isOn: $isOn)
    }
}

//#Preview {
//    CustomCheckBox()
//}
