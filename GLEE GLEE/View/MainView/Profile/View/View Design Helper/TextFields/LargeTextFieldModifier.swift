//
//  LargeTextFieldModifier.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 19/11/23.
//


import SwiftUI

struct LargeTextFieldVModifier<Content: View>: View {
    @State var title: String
    let font: String
    @ViewBuilder let content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(title)
                .foregroundColor(.primary)
                .font(.custom(font, size: 14))
            
            content
                .padding(.horizontal, 10)
                .font(.custom(FontManager.Poppins.light, size: 12))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                        .frame(height: 48)
                )
        }
//        .padding(.bottom, 5)
    }
}

struct ProfileTextFieldModifier<Content: View>: View {
    @State var title: String
    @ViewBuilder let content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(title)
                .foregroundColor(.primary)
                .font(.custom(FontManager.Poppins.regular, size: 14))
            
            content
                .padding(.horizontal, 10)
                .font(.custom(FontManager.Poppins.light, size: 12))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                        .frame(height: 48)
                )
        }
    }
}
