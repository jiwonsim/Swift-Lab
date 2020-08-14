//
//  RusableToast.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/13.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ReusableToast: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func populate(_ title: String?, backgroundColor: UIColor = .systemIndigo) {
        titleLabel.text = title ?? "Love Johnny"
        titleLabel.numberOfLines = 0
        
        self.alpha = 0.0
        self.backgroundColor = UIColor.clear
        self.layer.applySketchShadow()
        
        containerView.layer.cornerRadius = containerView.frame.height / 4
//        print(containerView.layer.cornerRadius)
        containerView.backgroundColor = backgroundColor
        containerView.layer.masksToBounds = true
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: "ReusableToast", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}
