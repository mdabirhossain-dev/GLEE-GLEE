//
//  UIFonts + Additions.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import UIKit

extension UIFont {
    
    enum InterWeight: String {
        case medium_500 = "Inter-Medium"
    }
    
    static func inter(_ weight: InterWeight, size: CGFloat) -> UIFont {
        if let font = UIFont(name: weight.rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    enum PoppinsWeight: String {
        case regular_400 = "Poppins-Regular"
        case medium_500 = "Poppins-Medium"
        case semiBold_600 = "Poppins-SemiBold"
        case bold_700 = "Poppins-Bold"
        case mediumItalic_500 = "Poppins-MediumItalic"
    }
    
    static func poppins(_ weight: PoppinsWeight, size: CGFloat) -> UIFont {
        if let font = UIFont(name: weight.rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    enum MontserratWeight: String {
        case regular_400 = "Montserrat-Regular"
        case medium_500 = "Montserrat-Medium"
        case semiBold_600 = "Montserrat-SemiBold"
        case bold_700 = "Montserrat-Bold"
    }
    
    static func montserrat(_ weight: MontserratWeight, size: CGFloat) -> UIFont {
        if let font = UIFont(name: weight.rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
