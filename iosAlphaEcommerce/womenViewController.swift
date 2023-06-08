//
//  womenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenViewController: UIViewController {
var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    @IBAction func addToCartButton(_ sender: Any) {
        count = count + 1
        let tabBar = self.tabBarController!.tabBar
        let newProduct = tabBar.items![1]
        newProduct.badgeColor = UIColor.gray
        newProduct.badgeValue = "\(count)"
    }
    

}
