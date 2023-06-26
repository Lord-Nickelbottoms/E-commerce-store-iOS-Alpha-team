//
//  DetailsViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/22.
//


import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var viewName: UIView!
    
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewEmail: UIView!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    //
    @IBOutlet weak var addressLbl: UILabel!
    //
    @IBOutlet weak var cellPhoneLbl: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var surnameLbl: UILabel!
    
    @IBOutlet weak var NameLbl: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    var firstNametxt: String!
    var lastNametxt: String!
    var emailtext: String!
    var addresstxt: String!
    var phonetxt: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NameLbl.text = firstNametxt
        surnameLbl.text = lastNametxt
        email.text = emailtext
        phone.text = phonetxt
        address.text = addresstxt
        
        
        
        viewName.layer.borderWidth = 1
        viewName.layer.borderColor = UIColor.black.cgColor
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.black.cgColor
        viewPhone.layer.borderWidth = 1
        viewPhone.layer.borderColor = UIColor.black.cgColor
        viewAddress.layer.borderWidth = 1
        viewAddress.layer.borderColor = UIColor.black.cgColor
        
        viewLastName.layer.borderWidth = 1
        viewLastName.layer.borderColor = UIColor.black.cgColor
        
        
        
    }
    
}
