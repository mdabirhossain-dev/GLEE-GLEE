//
//  InformationView.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 11/10/23.
//

import SwiftUI

struct InformationView: View {
    // MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    // Data
    let infoData: InformationData
    
    // MARK: - Body
    var body: some View {
        ZStack{
            Color(UIColor.appPrimaryBackground ?? .systemBackground)
                .ignoresSafeArea()
            
        VStack(alignment: .leading, spacing: 10) {
            Text(infoData.viewTitle ?? "")
                .foregroundColor(Color(red: 0.91, green: 0.2, blue: 0.19))
                .font(.custom(FontManager.Poppins.semiBold, size: 22))
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(infoData.dataList ?? [], id: \.id) { info in
                        VStack(alignment: .leading, spacing: 5) {
                            if !(info.title?.isEmpty ?? false) {
                                Text(info.title ?? "")
//                                    .foregroundColor(Color(.appIconForeground))
                                    .font(.custom(FontManager.Poppins.medium, size: 14))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            if !(info.description?.isEmpty ?? false) {
                                Text(info.description ?? "")
//                                    .foregroundColor(Color(.appIconForeground))
                                    .font(.custom(FontManager.Poppins.medium, size: 10))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
                .padding(.bottom, 75)
            }
        }
        .padding(.horizontal, 10)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image("arrow-left")
                            .foregroundColor(Color(UIColor.appPrimaryBackground ?? .systemBackground))
                    }
                    Text(infoData.backButtonTitle ?? "")
                        .font(.custom(FontManager.Poppins.semiBold, size: 18))
                        .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
                }
            }
        })
        .navigationBarHidden(false)
    }
}

// MARK: - Preview
struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(infoData: termsAndConditions)
    }
}
