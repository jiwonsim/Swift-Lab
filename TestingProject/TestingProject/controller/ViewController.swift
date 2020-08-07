//
//  ViewController.swift
//  TestingProject
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let correctUser = [User("doori", "doori0406"), User("johnny", "johnny0209")]
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        do {
            guard
                let username = userNameTextField.text,
                let password = passwordTextField.text
                else { throw ValidError.invalidValue }
            
            guard username.count > 3 else { throw ValidError.usernameTooShort }
            guard username.count < 20 else { throw ValidError.usernameTooLong }
            guard password.count > 3 else { throw ValidError.passwordTooShort }
            guard password.count < 20 else { throw ValidError.passwordTooLong }
            
            if let user = correctUser.first(where: { user in
                user.userName == username && user.password == password
            }) {
                presentAlert(with: "You successfully logged in as \(user.userName)")
            }
            else { throw ValidError.invalidValue }
        }
        catch {
            present(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        
    }


}
