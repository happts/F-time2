//
//  imageChange.swift
//  F-Time
//
//  Created by app on 17/7/28.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0, y: 0, width: Int(size.width), height: Int(size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        //let context = UIGraphicsGetCurrentContext()
        //CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
