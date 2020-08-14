//
//  CALayer+Extension.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/14.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

extension CALayer {
    func applySketchShadow(color: UIColor = .black,
                           alpha: Float = 0.2,
                           x: CGFloat = 0,
                           y: CGFloat = 2,
                           offset: CGFloat = 10,
                           spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = offset/UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        drawsAsynchronously = true
    }
}
