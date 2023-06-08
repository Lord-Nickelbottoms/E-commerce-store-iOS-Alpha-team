//
//  womenCollectionViewCell2.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenCollectionViewCell2: UICollectionViewCell {
    
        @IBOutlet weak var productImageView: UIImageView!
        
        @IBOutlet weak var priceLbl: UILabel!
        @IBOutlet weak var namelbl: UILabel!
        
        func setup1(with item1: Item1)
        {
            namelbl.text = item1.name
            priceLbl.text = "R " + String(item1.price)
            productImageView.image = item1.image
        }
    

    
}
