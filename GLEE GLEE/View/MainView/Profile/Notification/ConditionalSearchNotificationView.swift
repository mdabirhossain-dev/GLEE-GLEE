//
//  ConditionalSearchNotificationView.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 17/10/23.
//

import SwiftUI

struct ConditionalSearchNotificationView: View {
    // MARK: - PROPERTIES
    @State var isScreenCast: Bool
    @State var isSearch: Bool
    @State var isNotification: Bool
    
    
    // Dismiss view
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar
            HStack(spacing: 20) {
                Button {
                    // Dismissing from this view
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image("arrow-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text("Notification")
                    .font(.custom(FontManager.Poppins.semiBold, size: 18))
                
                Spacer()
                
                Button {
                    // Dismissing from this view
                    isScreenCast = true
                    isSearch = false
                    isNotification = false
                } label: {
                    Image("cast")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Button {
                    // Dismissing from this view
                    isScreenCast = false
                    isSearch = true
                    isNotification = false
                } label: {
                    Image("search")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Button {
                    // Dismissing from this view
                    isScreenCast = false
                    isSearch = false
                    isNotification = true
                } label: {
                    Image("notification")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            if isScreenCast {
                EmptyView()
            } else if isSearch {
                SearchView()
            } else if isNotification {
                NotificationsView()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
struct ConditionalSearchNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSearchNotificationView(isScreenCast: false, isSearch: true, isNotification: false)
    }
}
