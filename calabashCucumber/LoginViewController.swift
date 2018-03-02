//
//  LoginViewController.swift
//  calabashCucumber
//
//  Created by Ilan B on 01/03/2018.
//  Copyright © 2018 Ilan B. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    var formIsValid = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func loginAction() {
        let email = self.emailTextfield.text
        let password = self.passwordTextField.text

        if !self.validForm(email: email ?? "", password: password ?? "") {
            return
        }

        if let homeViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            AppDelegate.getDelegate()?.window?.rootViewController = homeViewController
        }
    }

    func validForm(email: String, password: String) -> Bool {
        if email == "" && password == "" {
            Message.showError(error: "Please, add a email and a password")

            return false
        }

        if !self.isValidEmail(email: email) {
            Message.showError(error: "Please, add a validate email")

            formIsValid = false
        }

        if password.count < 4 {
            Message.showError(error: "Please, enter a password sup to 3 char")

            return false
        }

        if email != "mail@mail.fr" || password != "1234" {
            Message.showError(error: "Login and password dont match")

            return false
        }

        if email == "mail@mail.fr" && password == "1234" {
            formIsValid = true
        }

        return formIsValid
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        return emailTest.evaluate(with: email)
    }
}
