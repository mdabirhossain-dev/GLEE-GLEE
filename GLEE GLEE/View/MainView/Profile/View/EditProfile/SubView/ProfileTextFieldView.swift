//
//  ProfileTextFiledView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI

struct ProfileTextFieldView: View {
    // MARK: - Properties
    let fieldTitle: String
    let fieldPlaceholder: String
    @Binding var text: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(fieldTitle)
                .font(.custom(FontManager.Poppins.semiBold, size: 14))
            
            TextFieldView(fieldPlaceholder: fieldPlaceholder, titleFontColor: Color.white, text: $text)
                .keyboardType(.default)
                .frame(maxWidth: .infinity)
                .frame(height: frameSize(minSize: 48, dynamicSize: 48/853 * DeviceInfos().deviceHeight))
                .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                .cornerRadius(10)
        }
    }
}

// MARK: - Preview
struct ProfileTextFiledView_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        ProfileTextFieldView(fieldTitle: "Name", fieldPlaceholder: "enter your name", text: $text)
            .preferredColorScheme(.dark)
    }
}
