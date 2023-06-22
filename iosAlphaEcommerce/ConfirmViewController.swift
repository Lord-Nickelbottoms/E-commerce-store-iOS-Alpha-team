//
//  ConfirmViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/21.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var lblDelivery: UILabel!
    
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblShippingTotal: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    
    var Name:String?
    var Surname:String?
    var Email:String?
    var Code:String?
    var City:String?
    var State:String?
    var Number:String?
   var UserId:Int=9
    
    var ProductAmount :Double!
    var Shipping :Double!
    var TotalAmount :Double!
    var orderNumber = Int.random(in: 10000...99999)
   
   var item: Users!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchApiData {[self] in
            fieldInicialize()
            addAlert(message: "Hello,\(Name!). Thank you for shopping with CLOTHING AVENUE. Your payment for R\(TotalAmount!) has been verified", title: "Successful!!!")
        }
        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: false )
        
        
        
       
    }
    
    func dataAsign() {
        
        print("Random Number = \(orderNumber)")
        TotalAmount = ProductAmount + Shipping
        Name = item.name.firstname.capitalized
        Surname = item.name.lastname.capitalized
        Email = item.email.lowercased()
        City = item.address.city
        Code = item.address.zipcode
        State = item.address.street
        Number = item.phone
    }
    
    
    func fieldInicialize() {
        dataAsign()
        lblName.text = Name! + " " + Surname!
        lblEmail.text = Email
        lblCity.text = City
        lblCode.text = Code
        lblStreet.text = State
        lblSubTotal.text = String(ProductAmount)
        lblShippingTotal.text = String(Shipping)
        lblTotalAmount.text = String(TotalAmount)
        lblOrderNumber.text = "Order Number #" + (String(orderNumber) + " !!!!")
    }
    
    func fetchApiData(completed: @escaping() -> ()){
            let url = URL(string:"https://fakestoreapi.com/users/\(UserId)")
            URLSession.shared.dataTask(with: url!) {data, result, error in

                if error == nil{
                    do{
                        self.item = try JSONDecoder().decode(Users.self, from: data!)
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
    
    
    
    @IBAction func btnConfirm(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CategoryViewController") as? CategoryViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: { _ in
                //Cancel Action
            }))
            self.present(alert, animated: true, completion: nil )
        }

}
