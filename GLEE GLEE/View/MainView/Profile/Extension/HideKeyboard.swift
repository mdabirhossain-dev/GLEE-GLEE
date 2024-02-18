//
//  HideKeyboard.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 16/10/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
