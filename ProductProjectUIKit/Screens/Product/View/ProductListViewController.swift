//
//  ProductListViewController.swift
//  ProductProjectUIKit
//
//  Created by user on 20/11/23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension ProductListViewController {
    func configuration(){
        initViewModel()
        observeEvent()
    }
    func initViewModel() -> () {
        viewModel.fetchProducts()
        
    }
    func observeEvent() -> () {
        viewModel.eventHandler = {
            [weak self]   event in
            guard let self else {
                print("no weak")
                return }
            switch event {
            case .loading:
                /// Indicator show
                print("Product loading....")
            case .stopLoading:
                // Indicator hide kardo
                print("Stop loading...")
            case .dataLoaded :
                print("data loaded...")
                print(self.viewModel.products)
            case .error(let error):
                print(error)
            }
            
        }
        
    }
}
