//
//  SingleViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/08.
//

import UIKit
import CoreData

// MARK: - Add to Cart
extension UIImageView {
    func downloadeds(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadeds(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class SingleViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblXS: UILabel!
    @IBOutlet weak var lblS: UILabel!
    
    @IBOutlet weak var lblM: UILabel!
    @IBOutlet weak var lblL: UILabel!
    @IBOutlet weak var lblXL: UILabel!

    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var cartCount: UIBarButtonItem!
    
    @IBOutlet weak var cart: UIBarButtonItem!

    
    var productName : String!
    var size : String!
    var brand : String!
    var category : String!
//    var description : String!
    var price : Double!
    var colour : String!
    var gender : String!
    var image: UIImage!
    
  //  var count = 0
    
    
    var name : String!
    var imgname : String!
    
    var array = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCategory.text = category
        lblProductName.text = name
        lblColor.text = colour
        lblPrice.text = String(price) + " ZAR"
        //lblGender.text = gender
        imgItem.image = UIImage(named: String(imgname))
        
        let iimg = imgname
        imgItem.downloadeds(from: iimg!)
        
        if size == "XS" {
            lblXS.textColor = UIColor(red: 0, green: 226, blue: 157, alpha: 50)
            lblXS.font = UIFont.systemFont(ofSize: 20)
        } else if size == "S"{
            lblS.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblS.font = UIFont.systemFont(ofSize: 22)
        } else if size == "M"{
            lblM.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblM.font = UIFont.systemFont(ofSize: 22)
        } else if size == "L"{
            lblL.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblL.font = UIFont.systemFont(ofSize: 22)
        } else if size == "XL"{
            lblXL.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblXL.font = UIFont.systemFont(ofSize: 22)
        }
        
        print(name!)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCartAdd(_ sender: Any) {
        createCoreData()
        
        

        let tabBar = self.tabBarController!.tabBar
        let cartIcon = tabBar.items![1]
        
        //count = count + 1
        var count = 0
        print(count+1)
        cartIcon.badgeColor = UIColor.red
        cartIcon.badgeValue = "\(count + 1)"
        //print(count)
    }
    
    @IBAction func btnViewCart(_ sender: Any) {
        
    }
    
    // MARK: - Core Data Add to Cart
    func createCoreData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartOrder", in: context)
        let newOrder = Carts(entity: entity!, insertInto: context)
        //imgItem.image = UIImage(named: String(imgname))
        
       
        newOrder.productname = lblProductName.text
        newOrder.productprice = lblPrice.text
        newOrder.productquantity = lblCategory.text
        //newOrder.productimage = UIImage(named:imgItem.image)
        do {
           try context.save()
            cartList.append(newOrder)
            
            //go back to the previous view controller
            navigationController?.popViewController(animated: true)
        }
        catch {
             print("Context save error")
        }
        
    }
   
}

