//
//  User.swift
//  TestingProject
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//

import Foundation

struct User {
    var userName: String
    var password: String
    
    init(_ userName: String, _ password: String) {
        self.userName = userName
        self.password = password
    }
}
