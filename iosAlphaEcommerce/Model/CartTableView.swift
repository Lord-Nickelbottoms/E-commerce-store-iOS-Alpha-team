//
//  CartTableView.swift
//  iosAlphaEcommerce
//
//  Created by Phenyo Malele on 2023/06/22.
//

import UIKit

var cartList = [Carts]()

class CartTableView: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTabItem: UITabBarItem!
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = tableView.dequeueReusableCell(withIdentifier: "CTableViewCell", for: indexPath) as? CTableViewCell else { return UITableViewCell()}
        
        let thisCart: Carts!
        
        thisCart = cartList[indexPath.row]
        cartCell.lblCellProductName.text = thisCart.productname
        cartCell.lblCellProductPrice.text = thisCart.productprice
        cartCell.lblCellProductQuantity.text = thisCart.productquantity
    
        
        
        return cartCell
    }
 
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
