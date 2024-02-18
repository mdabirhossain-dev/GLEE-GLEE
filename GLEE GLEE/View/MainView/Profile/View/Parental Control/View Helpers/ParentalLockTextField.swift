//
//  ParentalLockTextField.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import SwiftUI

struct ParentalLockTextField<ContentTextField: View>: View {
    @State var placeholderText: String
    @Binding var text: String
    @ViewBuilder let content: ContentTextField
    var body: some View {
        content
            .foregroundColor(.primary)
            .frame(height: 42.45614)
            .multilineTextAlignment(.center)
            .placeholderWithCustomColor(when: text.isEmpty, alignment: .center, placeholder: {
                Text(placeholderText)
                    .foregroundColor(.secondary)
                    .font(.custom(FontManager.Poppins.medium, size: 16))
            })
        
            .background(
                RoundedRectangle(cornerRadius: 29)
                    .padding(.horizontal)
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.5))
            )
    }
}
