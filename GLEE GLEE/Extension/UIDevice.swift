//
//  UIDevice.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
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
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
                return bottom > 0
     }
}
