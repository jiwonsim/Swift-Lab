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
    
    func populate(emoji: String?, title: String?, desc: String?) {
        self.backgroundColor = .white
        self.alpha = 0.0
        self.layer.cornerRadius = 50
        
        self.layer.applySketchShadow()
        
        emojiLabel.text = emoji ?? "🐐"
        titleLabel.text = title ?? "Love Johnny"
        descLabel.text = desc ?? "Johnny, you're the goat"
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
}

