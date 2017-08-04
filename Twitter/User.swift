//
//  User.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/05.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit
import NCMB

class User: NSObject {
    var name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    func signUp(callback: @escaping (_ message: String?) -> Void) {
        let user = NCMBUser()
        user.userName = name
        user.password = password
        user.signUpInBackground { (error) in
        }
    }

    func login(callback: (_ message: String?) -> Void) {
        NCMBUser.logInWithUsername(inBackground: self.name, password: self.password) { (user, error) in
        }
    }
}
