//
//  UserViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/22.
//

import UIKit


class UserViewController: UIViewController {

    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var Details: UIView!
    @IBOutlet weak var Favourites: UIView!
    @IBOutlet weak var Orders: UIView!
    @IBOutlet weak var Rewards: UIView!
    
    var name: String!
    
    //var item = [Users]()
    var item1: Users!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap_free = UITapGestureRecognizer(target: self, action: #selector(UserViewController.tapFunctionFree))
        Details.isUserInteractionEnabled = true
        Details.addGestureRecognizer(tap_free)
        
        
       // name = item1.username
        
        Rewards.layer.borderWidth = 1
        Rewards.layer.borderColor = UIColor.black.cgColor

    Details.layer.borderWidth = 1
    Details.layer.borderColor = UIColor.black.cgColor
    Details.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    Favourites.layer.borderWidth = 1
    Favourites.layer.borderColor = UIColor.black.cgColor
        
        //print(name)
        //item1.username
        
        //print(item.first?.username)!
        fetchApiData { [self] in
            print("Hello")
            //print(item1.username)
            userLbl.text = item1.username
           
        }
        
 
    }
    
    @IBAction func tapFunctionFree(sender: UITapGestureRecognizer) {
          print("tap working")
               
              
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
      //  let vc = storyboard?.instantiateViewController(identifier: "MyOrdersViewController") as? MyOrdersViewController
        
        vc?.firstNametxt = item1.name.firstname
        vc?.lastNametxt = item1.name.lastname
        vc?.emailtext = item1.email
        vc?.addresstxt = item1.address.city
        vc?.phonetxt = item1.phone
                self.navigationController?.pushViewController(vc!, animated: true)
            }
    
    
    func fetchApiData(completed: @escaping() -> ()){
        let url = URL(string: "https://fakestoreapi.com/users/1")
        URLSession.shared.dataTask(with: url!) {data, result, error in
            
            if error == nil{
                do{
                    self.item1 = try JSONDecoder().decode(Users.self, from: data!)
                    print(data!)
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

    @IBAction func btnDetails(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

}
