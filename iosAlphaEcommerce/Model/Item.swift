//
//  Item.swift
//  ios Clothing App
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import Foundation
import UIKit

struct Count{
    var counting : Int
}
class coun {
    var cc : Int = 3
}

//var counts: [Count] = [
//    Count(counting: 0)
//]

struct Item{
    let gender: String
    let category: String
    let name: String
    let size: String
    let price: Double
    let colour: String
    let image: UIImage
}

let items: [Item] = [
    Item(gender: "Mens", category: "Jackets", name:"Blazer", size: "S", price: 250.99, colour: "Black", image: #imageLiteral(resourceName: "black jacket")),
    
    Item(gender: "Mens", category: "Pants", name: "Jogger", size: "M", price: 250.99, colour: "Grey", image: #imageLiteral(resourceName: "grey joggers")),
    
    Item(gender: "Mens", category: "Shirts", name: "Collar Shirt", size: "L", price: 199.99, colour: "Blue", image: #imageLiteral(resourceName: "blueShirt")),
    
    Item(gender: "Mens", category: "Shorts", name: "Corduroy", size: "XL", price: 300.99, colour: "White", image: #imageLiteral(resourceName: "white shorts")),
    
    Item(gender: "Mens", category: "T-shirts", name: "Round Neck", size: "S", price: 500.00, colour: "Navy", image: #imageLiteral(resourceName: "navyshirt")),
    
    Item(gender: "Womens", category: "Jackets", name: "Coat", size: "S", price: 730.00, colour: "Black", image: #imageLiteral(resourceName: "blackCoat")),
    
    Item(gender: "Womens", category: "Pants", name: "Jean", size: "M", price: 799.99, colour: "Blue", image: #imageLiteral(resourceName: "blueJeans")),
    
    Item(gender: "Womens", category: "Dresses", name: "Bodycon", size: "L", price: 250.99, colour: "Pink", image: #imageLiteral(resourceName: "pinkbodycom")),
    
    Item(gender: "Womens", category: "Skirts", name: "Mini Skirt", size: "XL", price: 250.99, colour: "Purple", image: #imageLiteral(resourceName: "purpleskirt")),
    
    Item(gender: "Womens", category: "Tops", name: "Strapless", size: "M", price: 250.99, colour: "Black", image: #imageLiteral(resourceName: "blackstriplesstop"))
]
