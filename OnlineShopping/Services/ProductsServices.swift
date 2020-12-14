//
//  ProductsServices.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 12.12.2020.
//

import Foundation

class ProductsServices {

    func getProducts(completion: @escaping ((Product?, Error?) -> ())){
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) {(data,resp,err) in
            guard let data = data else { return }
            do{
                let productsData = try JSONDecoder().decode(Product.self, from: data)
                completion(productsData,nil)
            } catch let err {
                completion(nil,err)
            }
        }.resume()
    }
}
