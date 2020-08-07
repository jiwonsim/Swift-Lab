//
//  ViewController+Error.swift
//  TestingProject
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

extension ViewController {
    enum ValidError: LocalizedError {
        case invalidValue
        case passwordTooShort
        case passwordTooLong
        case usernameTooShort
        case usernameTooLong
        
        var errorDescription: String? {
            switch self {
            case .invalidValue:
                return "You have entered an invalid value"
            case .passwordTooShort:
                return "Your password is too short"
            case .passwordTooLong:
                return "Your password is too long"
            case .usernameTooShort:
                return "Your username is too short"
            case .usernameTooLong:
                return "Your username is too long"
            }
        }
    }
    
    enum LoginError: LocalizedError {
        case invalidCredentials
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Invalid username or password. Please try again!"
            }
        }
    }
}
