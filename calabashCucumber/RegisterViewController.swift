//
//  RegisterViewController.swift
//  calabashCucumber
//
//  Created by Ilan B on 01/03/2018.
//  Copyright © 2018 Ilan B. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var copyPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func RegisterAction() {
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        let copyPassword = self.copyPasswordTextField.text

        if !validForm(email: email ?? "", password: password ?? "", copyPass: copyPassword ?? "") {
            return
        }

        if let homeViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            AppDelegate.getDelegate()?.window?.rootViewController = homeViewController
        }
    }

    func validForm(email: String, password: String, copyPass: String) -> Bool {
        if email == "" && password == "" && copyPass == "" {
            Message.showError(error: "Please, add a email and a password")

            return false
        }

        if !self.isValidEmail(email: email) {
            Message.showError(error: "Please, add a validate email")
        }

        if password.count < 4 {
            Message.showError(error: "Please, enter a password sup to 3 char")

            return false
        }

        if password != copyPass {
            Message.showError(error: "Your password its not same")

            return false
        }

        return true
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        return emailTest.evaluate(with: email)
    }
}
