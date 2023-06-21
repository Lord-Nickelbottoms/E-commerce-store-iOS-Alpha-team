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
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var user: Users!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		activityIndicator.isHidden.toggle()
        fetchApiData {[self] in
            if(emailTextField.text == user.email && passwordTextField.text == user.password)
            {
                
            }
            else
            {
                
            }
        }
    }
    func fetchApiData(completed: @escaping() -> ()){
        let url = URL(string: "https://fakestoreapi.com/users/1")
        URLSession.shared.dataTask(with: url!) {data, result, error in
            
            if error == nil{
                do{
                    self.user = try JSONDecoder().decode(Users.self, from: data!)
                }
                catch{
                    print("Error fetching data from API.")
                }
                
                DispatchQueue.main.async {
                    completed()
                }
            }
        }.resume()
    }

	@IBAction func loginButton(_ sender: UIButton) {
		
		activityIndicator.isHidden.toggle()
		activityIndicator.startAnimating()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){ [self] in
			let webService = WebService()
			webService.loginUser(email: emailTextField.text!, password: passwordTextField.text!)
			
			activityIndicator.stopAnimating()
			activityIndicator.isHidden.toggle()
		}
        fetchApiData {[self] in
            if(emailTextField.text == user.email && passwordTextField.text == user.password)
            {
                
            }
            else
            {
                addAlert(message: "Invalid password or email", title: "Invalid password")
            }
            
        }
	}
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

