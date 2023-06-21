//
//  LoginViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 135 on 2023/06/20.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	@IBAction func loginButton(_ sender: UIButton) {
		
		let webService = WebService()
		webService.loginUser(email: emailTextField.text!, password: passwordTextField.text!)
	}
    

}
