//
//  FontSize.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 16/10/23.
//

import Foundation


func fontSize(defaultSize: CGFloat) -> CGFloat {
    let dynamicSize = defaultSize/852 * DeviceInfos().deviceHeight
    let size = dynamicSize < defaultSize ? defaultSize : dynamicSize
    
    return size
}
