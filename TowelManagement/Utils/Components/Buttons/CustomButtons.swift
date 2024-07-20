//
//  CustomButtons.swift
//  TowelManagement
//
//  Created by mac on 01/06/2024.
//

import SwiftUI

struct CustomButtons: View {
    let actions: () -> Void
    let displayText: String
    var body: some View {
        Button(action: actions, label: {
            Text(displayText)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(EdgeInsets(top: -20, leading: 20, bottom: 0, trailing: 20))
        })
    }
}


