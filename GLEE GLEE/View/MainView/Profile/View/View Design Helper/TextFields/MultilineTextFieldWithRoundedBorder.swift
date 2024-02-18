//
//  MultilineTextFieldWithRoundedBorder.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import Foundation
import SwiftUI

struct MultilineTextFieldWithRoundedBorder: View {
    // MARK: - Properties
    let title: String?
    let textFieldPlaceholder: String
    var height: CGFloat
    var fieldBorderLineWidth: CGFloat?
    @Binding var fieldText: String
    
    // MARK: - Body
    var body: some View {
        //        VStack(spacing: 0) {
        //            TextFieldTitleAtUsageHistory(text: title)
        //                .padding(.vertical, 10)
        
        ZStack(alignment: .top) {
            Text(textFieldPlaceholder)
                .padding([.horizontal, .vertical], 10)
                .font(.custom(FontManager.Poppins.semiBold, size: 12))
                .foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .opacity(fieldText.isEmpty ? 0.8 : 0.0)
            
            MultilineTextField(text: $fieldText)
                .padding(.horizontal, 5)
                .font(.custom(FontManager.Poppins.medium, size: 12))
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.59, green: 0.59, blue: 0.59), lineWidth: fieldBorderLineWidth ?? 1.5)
                )
        }
        //        }
    }
}

// MARK: - Preview
struct MultilineTextFieldWithRoundedBorder_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextFieldWithRoundedBorder(title: "", textFieldPlaceholder: "", height: 98.75, fieldText: .constant("Demo"))
    }
}
