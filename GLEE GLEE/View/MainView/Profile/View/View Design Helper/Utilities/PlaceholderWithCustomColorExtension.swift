//
//  PlaceholderWithCustomColorExtension.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import Foundation
import SwiftUI

extension View {
    func placeholderWithCustomColor<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
