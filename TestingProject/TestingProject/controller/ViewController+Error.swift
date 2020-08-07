//
//  ViewController+Error.swift
//  TestingProject
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

extension ViewController {
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
