//
//  ProductViewModel.swift
//  ProductProjectUIKit
//
//  Created by user on 20/11/23.
//

import Foundation


final class ProductViewModel {
    
    
    var products : [Product] = []
    var eventHandler : ((_ event: Event ) -> Void)?
    
    
    func fetchProducts () {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [Product].self, type: EndPointItems.products) {
            response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
            
        }
        
        
        
        
        /*    APIManager.shared.fetchProducts { response in
         self.eventHandler?(.stopLoading)
         switch response {
         case .success(let products):
         
         self.products = products
         self.eventHandler?(.dataLoaded)
         case .failure(let error):
         print(error)
         self.eventHandler?(.error(error))
         }
         } */
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
