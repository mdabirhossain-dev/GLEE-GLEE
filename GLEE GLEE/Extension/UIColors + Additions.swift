//
//  UIColors + Additions.swift
//  AmberIT
//
//  Created by Khaled on 21/11/23.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    static let appPrimaryBackground = UIColor(named: ColorString.appPrimaryBackground.rawValue)
    static let appIconColor = UIColor(named: ColorString.appIconForeground.rawValue)
    static let largeTextFieldBackground = UIColor(named: ColorString.largeTextFieldBackground.rawValue)
    static let placeholderTextfield = UIColor(named: ColorString.placeholderTextfield.rawValue)
    static let continuneWatchingCell = UIColor(named: ColorString.continuneWatchingCell.rawValue)
    static let filterBorderColor = UIColor(named: ColorString.filterBorderColor.rawValue)
}

enum ColorString: String {
    case appPrimaryBackground = "appPrimaryBackground"
    case appIconForeground = "appIconForeground"
    case largeTextFieldBackground = "largeTextFieldBackground"
    case placeholderTextfield = "placeholderTextfield"
    case continuneWatchingCell = "continuneWatchingCell"
    case filterBorderColor = "filterBorderColor"
}
