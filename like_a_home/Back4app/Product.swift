//
//  Product.swift
//  like_a_home
//
//  Created by User on 05/06/2022.
//

import Foundation
import ParseSwift

struct Product: ParseObject {
    var originalData: Data?
    
    // Required properties from ProductType protocol
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    /// Name for the ProductType item
    var productName: String?
    
    /// Description for the ProductType item
    var descriptionProduct: String?
    
    var productFoto: ParseFile?
}
