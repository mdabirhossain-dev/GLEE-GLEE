//
//  HideSwiftUIView.swift
//  GLEE GLEE
//
//  Created by Tanvir Rahman on 10/12/23.
//

import Foundation
import SwiftUI

struct HideViewModifier: ViewModifier {
    @State var isHidden: Bool
    func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        }else {
            content
        }
    }
}

extension View {
    func hideThisPartOfCode() -> some View{
        return self.modifier(HideViewModifier(isHidden: true))
    }
}

