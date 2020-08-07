//
//  ValidationService.swift
//  TestingProject
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

struct ValidationService {
    func validationUsername(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        return username
    }
    
    func validationPassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count > 3 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
}

enum ValidationError: LocalizedError {
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
