//
//  CollectionViewCell.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 13.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }

    func configure(product: ProductElement){
        productTitle.text = product.title
        productPrice.text = "\(product.price) TL"
        if product.image != ""{
            downloadImage(with: URL(string: product.image)!)
        }
        productTitle.numberOfLines = 2
        productTitle.textAlignment = .left
        productTitle.sizeToFit()
    }

    func downloadImage(with url : URL){
        URLSession.shared.dataTask(with: url){ data,reponse,error in
            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data!)
            }
        }.resume()
    }
}
