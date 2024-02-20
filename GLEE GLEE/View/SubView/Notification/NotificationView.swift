//
//  NotificationView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack{
            Color(ColorString.appPrimaryBackground.rawValue).ignoresSafeArea()
            VStack {
                NotificationsViewControllerSwiftUI()
                    .profileNavigationToolbar(title: "Notifications", isTitle: true, isSearch: false, isNotification: false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(false)
            }
        }
    }
}

struct NotificationsViewControllerSwiftUI: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return NotificationViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    typealias UIViewControllerType = UIViewController
}
