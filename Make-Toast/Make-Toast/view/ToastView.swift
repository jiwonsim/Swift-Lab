//
//  ToastView.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/13.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ToastView: UIView {
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func populate(emoji: String? = "🐐", title: String? = "Love Johnny", desc: String? = "Johnny, you're the goat") {
        self.backgroundColor = .white
        self.alpha = 0.0
        self.layer.cornerRadius = 50
        
        self.layer.applySketchShadow(color: .black, alpha: 0.2, blur: 15)
        
        emojiLabel.text = emoji
        titleLabel.text = title
        descLabel.text = desc
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: "ToastView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func animate() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.8
        }) { (true) in
            UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseOut, animations: {
                 self.alpha = 0.0
            }, completion: {(isCompleted) in
                self.removeFromSuperview()
            })
        }
        
    }
}

extension CALayer {
    func applySketchShadow(color: UIColor = .black,
                           alpha: Float = 0.5,
                           x: CGFloat = 0,
                           y: CGFloat = 2,
                           blur: CGFloat = 4,
                           spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur/2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        
        shouldRasterize = true 
    }
}
