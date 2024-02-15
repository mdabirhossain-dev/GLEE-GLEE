//
//  GLEE_GLEEApp.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI

@main
struct GLEE_GLEEApp: App {
    // MARK: - Properties
    @StateObject var homeDataVM = HomeDataVM()
    
    var body: some Scene {
        WindowGroup {
            TabItemsView()
                .environmentObject(homeDataVM)
        }
    }
}
