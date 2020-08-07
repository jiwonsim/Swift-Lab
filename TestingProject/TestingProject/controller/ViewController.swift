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
    
    private let validation: ValidationService

    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        do {
            let username = try validation.validationUsername(userNameTextField.text)
            let password = try validation.validationPassword(passwordTextField.text)
            
            if let user = correctUser.first(where: { user in
                user.userName == username && user.password == password
            }) {
                presentAlert(with: "You successfully logged in as \(user.userName)")
            }
            else { throw LoginError.invalidCredentials }
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
