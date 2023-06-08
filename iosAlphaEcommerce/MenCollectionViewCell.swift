//
//  MenCollectionViewCell.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 139 on 2023/06/08.
//

import UIKit

class MenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    func setup(with item: Item)
    {
        productImageView.image = item.image
        lblName.text = item.name
    }
}
