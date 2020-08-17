//
//  UIView+Animation.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/14.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

enum Usage {
    case normal
    case toast(value: Toast)
}

enum Toast {
    case completed
    case updated
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
    
    func setAnchor(_ superView: UIView,
                top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0,
                leading: NSLayoutXAxisAnchor? = nil, paddingLeading: CGFloat = 0,
                trailing: NSLayoutXAxisAnchor? = nil, paddingTrailing: CGFloat = 0,
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
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing).isActive = true
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
    
    func anchor(_ superView: UIView, usage: Usage,
                top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0,
                leading: NSLayoutXAxisAnchor? = nil, paddingLeading: CGFloat = 0,
                trailing: NSLayoutXAxisAnchor? = nil, paddingTrailing: CGFloat = 0,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                width: CGFloat = 0, widthRelation: Relation = .equal,
                height: CGFloat = 0, heightRelation: Relation = .equal) {
        
        switch usage {
        case .normal:
            setAnchor(superView,
                      top: top, paddingTop: paddingTop,
                      bottom: bottom, paddingBottom: paddingBottom,
                      leading: leading, paddingLeading: paddingLeading,
                      trailing: trailing, paddingTrailing: paddingTrailing,
                      centerX: centerX, centerY: centerY,
                      width: width, widthRelation: widthRelation,
                      height: height, heightRelation: heightRelation)
        case .toast(value: .completed):
            setAnchor(superView,
                      bottom: superView.bottomAnchor, paddingBottom: -30,
                      leading: superView.leadingAnchor, paddingLeading: 15,
                      trailing: superView.trailingAnchor, paddingTrailing: -15,
                      height: 150, heightRelation: .equal)
        case .toast(value: .updated):
            setAnchor(superView,
                      bottom: superView.bottomAnchor, paddingBottom: -30,
                      leading: superView.leadingAnchor, paddingLeading: 15,
                      trailing: superView.trailingAnchor, paddingTrailing: -15)
        }
    }
}
