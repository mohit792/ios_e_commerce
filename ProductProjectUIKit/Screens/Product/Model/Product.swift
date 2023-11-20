//
//  File.swift
//  ProductProjectUIKit
//
//  Created by user on 20/11/23.
//

import Foundation


struct Product : Decodable{
    
    let id : Int
    let title : String
    let price : Int
    let description : String
    let images : [String]
    let creationAt : String
    let updatedAt : String
    let category : ProductCategory
    
}
struct ProductCategory : Decodable {
        let id : Int
        let name : String
        let image : String
        let creationAt : String
        let updatedAt : String
    }
