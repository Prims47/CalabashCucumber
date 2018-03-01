//
//  ViewController.swift
//  calabashCucumber
//
//  Created by Ilan B on 01/03/2018.
//  Copyright © 2018 Ilan B. All rights reserved.
//

import UIKit

class FrontController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LoginAction() {
        guard let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "LoginViewController") as? LoginViewController else {
                return
        }

        self.present(loginViewController, animated: true, completion: nil)
    }

    @IBAction func RegisterAction() {
        guard let registerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "RegisterViewController") as? RegisterViewController else {
                return
        }

        self.present(registerViewController, animated: true, completion: nil)
    }
}

