//
//  ParentalControlRedButton.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import SwiftUI

struct ParentalControlRedButton: View {
    var buttonTitle: String
    var isDisabled: Bool?
    var body: some View {
        Text(buttonTitle)
            .font(.custom(FontManager.Poppins.hevay, size: 16))
            .frame(height: 42.45614)
            .foregroundColor(.white.opacity(isDisabled ?? false ? 0.7 : 1))
            .font(.system(size: 15, design: .monospaced))
            .background(
                Rectangle()
                    .foregroundColor( Color(red: 0.91, green: 0.2, blue: 0.19).opacity(isDisabled ?? false ? 0.7 : 1))
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .cornerRadius(39)
                
            )
        
    }
}

