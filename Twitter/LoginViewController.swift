//
//  LoginViewController.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/05.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSignUpButton(_ sender: UIButton) {
        let user = User(name: nameTextField.text!, password: passwordTextField.text!)
        user.signUp { (message) in
            if let unwrappedMessage = message {
                self.showAlert(message: unwrappedMessage)
                print("サインアップ失敗")
            } else {
                self.dismiss(animated: true, completion: nil)
                print("サインアップ成功")
            }
        }
    }
    
    //アラートを表示させるメソッドを定義
    func showAlert(message: String?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        let user = User(name: nameTextField.text!, password: passwordTextField.text!)
        user.login { (message) in
            if let unwrappedMessage = message {
                self.showAlert(message: unwrappedMessage)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
