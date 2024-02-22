//
//  ProfileToolBarModifier.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import SwiftUI

struct ProfileToolBarModifier: ViewModifier {
    
    var title: String
    @State var isTitle: Bool
    @State var isSearch: Bool
    @State var isNotification: Bool
    
    @Environment(\.presentationMode) var presentation
    
    func body(content: Content) -> some View {
        return content
            .toolbar {
                // Commented
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    if isTitle {
//                        Button{
//                            presentation.wrappedValue.dismiss()
//                        }label: {
//                            Image("arrow-left")
//                        }
//                        Text(title)
//                            .foregroundColor(Color(ColorString.appIconForeground.rawValue))
//                            .font(.custom(FontManager.Poppins.semiBold, size: 18))
//                            .onTapGesture {
//                                presentation.wrappedValue.dismiss()
//                            }
//                    }else {
//                        Image("gelegele_icon")
//                            .resizable()
//                    }
//                }
//                
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    HStack(spacing: 20){
//                        if isSearch {
//                            NavigationLink{
//                                SearchView()
//                            }label: {
//                                Image("search")
//                                    .foregroundColor(.primary)
//                            }.buttonStyle(.plain)
//                        }
//                        if isNotification {
//                            NavigationLink{
//                                NotificationsView()
//                            }label: {
//                                Image("notification")
//                                    .foregroundColor(.primary)
//                            }.buttonStyle(.plain)
//                        }
//                    }
//                }
                
            }
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func profileNavigationToolbar(title: String, isTitle: Bool, isSearch: Bool, isNotification: Bool) -> some View {
        return self.modifier(ProfileToolBarModifier(title: title, isTitle: isTitle, isSearch: isSearch, isNotification: isNotification))
    }
}
