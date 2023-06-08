//
//  womenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenViewController: UIViewController {
var count = 0
    var da = [Count]()
    var dd = coun();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    
    }
    
   
    

    @IBAction func addToCartButton(_ sender: Any) {
        
        
        count = count + 1
        dd.cc += count
        let tabBar = self.tabBarController!.tabBar
        let newProduct = tabBar.items![1]
        newProduct.badgeColor = UIColor.red
        newProduct.badgeValue = "\(count)"
        dd.cc = dd.cc + count
        print(dd.cc)
    }
    

}

