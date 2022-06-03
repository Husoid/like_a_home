//
//  ProductTypeList.swift
//  like_a_home
//
//  Created by User on 02/06/2022.
//

import Foundation
import ParseSwift

struct ProductType: ParseObject {
    var originalData: Data?
    
    // Required properties from ProductType protocol
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    /// Name for the ProductType item
    var nameType: String?
    
    /// Description for the ProductType item
    var description: String?
}
