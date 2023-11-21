//
//  ProductCell.swift
//  ProductProjectUIKit
//
//  Created by user on 20/11/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    var product: Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration(){
        guard let product else { return }
        productTitleLabel.text = product.title
        productDescription.text = product.description
        productImageView.setImage(with: product.images[0])
        
    }
    
}
