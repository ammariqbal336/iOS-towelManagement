//
//  Overlay.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import Foundation
import SwiftUI
struct Overlay<T: View> : ViewModifier {
    @Binding var show: Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
    
}

extension View {
    
    func overlay<T: View>(overlayView: T,show: Binding<Bool>) -> some View {
        self.modifier(Overlay(show: show, overlayView: overlayView))
    }
}
