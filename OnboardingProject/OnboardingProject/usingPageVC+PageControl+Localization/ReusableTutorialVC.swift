//
//  ReusedTutorialVC.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/10.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ReusableTutorialVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleName = String()
    var imageName = String()
    
    func populate(_ name: String) {
        imageName = name
        titleName = "\(name)".localized()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleName
        imageView.image = UIImage(named: imageName)
    }
}

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func localized(with argument: CVarArg = [], comment: String = "") -> String {
        return String(format: self.localized(comment: comment), argument)
    }
}
