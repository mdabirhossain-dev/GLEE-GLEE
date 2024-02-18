//
//  FrameSize.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 15/10/23.
//

import Foundation


func frameSize(minSize: CGFloat, dynamicSize: CGFloat) -> CGFloat {
    let size = dynamicSize < minSize ? minSize : dynamicSize
    
    return size
}
