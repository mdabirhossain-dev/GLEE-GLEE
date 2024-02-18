//
//  ProfileInformationExpandableView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 5/10/23.
//

import SwiftUI


struct ProfileInformationExpandableView: View {
    // MARK: - Properties
    let title: String
        
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 22, height: 22)
                
                Text(title)
                    .font(.custom(FontManager.Montserrat.medium, size: 12))
                    .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
                
                Spacer()
                
                Image("chevron.right")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            .padding(.bottom, 17)
        }
    }
}

// MARK: - Preview
struct ProfileInformationExpandableView_Previews: PreviewProvider {
    static var previews: some View {
    ProfileInformationExpandableView(title: "Demo Title")
            .preferredColorScheme(.dark)
    }
}
