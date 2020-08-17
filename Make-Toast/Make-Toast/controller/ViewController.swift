//
//  ViewController.swift
//  Make-Toast
//
//  Created by 심지원 on 2020/08/11.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    
    var toastView: UIView { return self.view as! ToastView }
    
    @IBAction func didTapSimpleToast(_ sender: Any) {
        showSimpleToast(titleTextField.text, message: messageTextField.text, controller: self, delay: 1)
    }
    
    @IBAction func didTapHardToast(_ sender: Any) {
        let toast = ToastView()
        toast.populate(emoji: emojiTextField.desc, title: titleTextField.desc, desc: messageTextField.desc)
        toast.anchor(self.view, usage: .toast(value: .completed))
        toast.animateForToast()
    }
    
    @IBAction func didTapToastButton(_ sender: Any) {
        let toast = ReusableToast()
        toast.populate(titleTextField.desc)
        toast.anchor(self.view, usage: .toast(value: .updated))
        toast.animateForToast()
    }
    
    func showSimpleToast(_ title: String?, message: String? = "", controller: UIViewController, delay: Double) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 1
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    func showHardToast() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        emojiTextField.autocorrectionType = .no
        titleTextField.autocorrectionType = .no
        messageTextField.autocorrectionType = .no
    }
}


extension UITextField {
    var desc: String? {
        if self.text == "" { return nil }
        return self.text
    }
}
