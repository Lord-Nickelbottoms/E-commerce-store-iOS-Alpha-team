//
//  CTableViewCell.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 139 on 2023/06/23.
//

import UIKit

class CTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblCellProductPrice: UILabel!
    @IBOutlet weak var lblCellProductQuantity: UILabel!
    @IBOutlet weak var lblCellProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
