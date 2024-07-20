//
//  CustomTextField.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

struct CustomTextField: View {
    let hint: String
    @Binding var text: String
    var paddingApply: EdgeInsets?
    
    var keyboardType: UIKeyboardType? = UIKeyboardType.default
    var body: some View {
        TextField(hint, text: $text)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color(white: 0.9))
            .cornerRadius(10)
            .keyboardType(keyboardType ?? .default)
    }
}

