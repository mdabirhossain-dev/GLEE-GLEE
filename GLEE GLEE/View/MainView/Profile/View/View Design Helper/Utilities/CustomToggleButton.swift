//
//  CustomToggleButton.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import SwiftUI

struct CustomToggleButton: View {
    // MARK: - Properties
    @Binding var isToggle: Bool
    // MARK: - Body
    var body: some View {
        ZStack(alignment: isToggle ? .trailing : .leading){
            Capsule()
                .stroke(Color(UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1)), lineWidth: 3)
                .frame(width: 35, height: 17)
            Circle()
                .frame(width: 16, height: 15)
                .foregroundColor(isToggle ? Color(UIColor(red: 0.9, green: 0.04, blue: 0.08, alpha: 1)) : Color(UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1)) )
            Circle()
                .stroke(Color(UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 0.7)), lineWidth: 3)
                .frame(width: 17, height: 16)
        }
        .onTapGesture {
            withAnimation {
                isToggle.toggle()
            }
        }
        .onChange(of: isToggle) { newValue in
            let appAppearance = UserDefaultKeys.appAppearance.rawValue
            let dark = UserDefaultKeys.dark.rawValue
            let light = UserDefaultKeys.light.rawValue
            
            UserDefaultsManager.shared.set(value: newValue ? dark : light, forKey: appAppearance)
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = newValue ? .dark : .light
            }
        }
    }
}
