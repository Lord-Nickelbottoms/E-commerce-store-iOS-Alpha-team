//
//  Carts.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 117 on 2023/06/23.
//

import CoreData

@objc(Carts)
class Carts: NSManagedObject {
    @NSManaged var productname: String!
    @NSManaged var productprice: String!
    @NSManaged var productquantity: String!
}
