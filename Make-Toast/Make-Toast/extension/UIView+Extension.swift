//
//  UIView+Animation.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/14.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

enum Toast {
    case normal
    case special
}

enum Relation {
    case equal
    case lessThan
    case greaterThan
}

extension UIView {
    
    func animateForToast() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.8
        }) { (true) in
            UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
                 self.alpha = 0.0
            }, completion: {(isCompleted) in
                self.removeFromSuperview()
            })
        }
    }
    
    func anchor(_ superView: UIView,
                top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0,
                left: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0,
                right: NSLayoutXAxisAnchor? = nil, paddingRight: CGFloat = 0,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                width: CGFloat = 0, widthRelation: Relation = .equal,
                height: CGFloat = 0, heightRelation: Relation = .equal) {
        superView.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if width != 0 {
            switch widthRelation {
            case .equal:
                widthAnchor.constraint(equalToConstant: width).isActive = true
            case .lessThan:
                widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
            case .greaterThan:
                widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
            }
        }
        if height != 0 {
            switch heightRelation {
            case .equal:
                heightAnchor.constraint(equalToConstant: height).isActive = true
            case .lessThan:
                heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
            case .greaterThan:
                heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
            }
        }
    }
}
