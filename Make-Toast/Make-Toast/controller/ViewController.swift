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
        let toast = ToastView(frame: CGRect(x: 15, y: self.view.frame.height - 180, width: self.view.frame.width - 30, height: 150))
        
        toast.populate()
        self.view.addSubview(toast)
        toast.animate()
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
