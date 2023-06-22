//
//  LoginViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 135 on 2023/06/20.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var user: Users!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		activityIndicator.isHidden.toggle()
		
		//MARK: Commented out to use Firebase code
		//        fetchApiData {[self] in
		//            if(emailTextField.text == user.email && passwordTextField.text == user.password)
		//            {
		//
		//            }
		//            else
		//            {
		//
		//            }
		//        }
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
		
		guard let email = emailTextField.text else { return }
		guard let password = passwordTextField.text else { return }
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.8){ [self] in
			
			if(emailTextField.text == "" || passwordTextField.text == "")
			{
				addAlert(message: "Field cannot be empty!", title: "Uh Oh")
				
			}
			else{
				Auth.auth().signIn(withEmail: email, password: password, completion: {firebaseResult, error in
					if let error = error{
						print("Error logging in!!")
						self.addAlert(message: "Invalid Email or Password. Please try again.", title: "Ha Ha, no!")
					}
					else{
						let storyboard = UIStoryboard(name: "Main", bundle: nil)
						let profileVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
						let vc = UIViewController()
						vc.modalPresentationStyle = .fullScreen
						self.present(profileVC, animated: true, completion: nil)
					}
				})
			}
			
			activityIndicator.stopAnimating()
			activityIndicator.isHidden.toggle()
		}
		//        fetchApiData {[self] in
		//            if(emailTextField.text == "" && passwordTextField.text == "")
		//            {
		//				Auth.auth().signIn(withEmail: email, password: password, completion: {firebaseResult, error in
		//					if let error = error{
		//						print("Error logging in!!")
		//					}
		//					else{
		//						let storyboard = UIStoryboard(name: "Main", bundle: nil)
		//						let profileVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
		//						let vc = UIViewController()
		//					vc.modalPresentationStyle = .fullScreen
		//					self.present(profileVC, animated: true, completion: nil)
		//					}
		//				})
		//            }
		//            else
		//            {
		//                addAlert(message: "Invalid password or email", title: "Invalid password")
		//            }
	}
	
//	}
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

