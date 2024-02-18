//
//  UIDevice.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import Foundation
import SwiftUI


extension UIDevice {
    var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var isTV: Bool {
        UIDevice.current.userInterfaceIdiom == .tv
    }
    
    var haveNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
                return bottom > 0
     }
}
