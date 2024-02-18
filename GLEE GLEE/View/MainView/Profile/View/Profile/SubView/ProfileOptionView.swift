//
//  ProfileOptionView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 27/9/23.
//

import SwiftUI

struct ProfileOptionView: View {
    // MARK: - Properties
    let image: String
    let title: String
    @Binding var arrowRotation: Bool
    
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                Image(image)
                    .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
                Text(title)
                    .font(.custom(FontManager.Poppins.medium, size: 16))
                    .foregroundColor(Color.primary)
                
                Spacer()
                
                Image("chevron.right")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .rotationEffect(.degrees(arrowRotation ? 90 : 0))
            }
            .padding(.vertical, 17)
        }
    }
}

// MARK: - Preview
struct ProfileOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionView(image: "setting", title: "Demo Title", arrowRotation: .constant(false))
            .preferredColorScheme(.dark)
    }
}
