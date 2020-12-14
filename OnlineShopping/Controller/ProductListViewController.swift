//
//  ProductListViewController.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 12.12.2020.
//

import UIKit

class ProductListViewController: UIViewController , PassCategoryBack {

    var products: Product?

    @IBOutlet weak var productListView: ProductCollectionView!
    @IBOutlet weak var sortAndFilterView: SortAndFilterView!

    override func viewWillAppear(_ animated: Bool) {
        productListView.products = products
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        sortAndFilterView.filterButton.addTarget(self, action: #selector(goFiltersViewController(_:)), for: .touchUpInside)
    }

    @objc func goFiltersViewController(_ sender: UIButton){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let filtersViewController = storyboard.instantiateViewController(identifier: "filterList") as! FiltersViewController
        filtersViewController.delegate = self
        filtersViewController.modalPresentationStyle = .custom
        filtersViewController.categories = findCategories()
        self.present(filtersViewController, animated: true, completion: nil)
    }

    func findCategories() -> [String]{
        var categories : [String] = []
        for product in products! {
            categories.append(product.category.rawValue)
        }
        categories = Array(Set(categories))

        return categories
    }
    
    func passCategory(category: String) {
        if category != "" {
            let filtered = products!.filter { catproduct in
                return catproduct.category.rawValue == category
            }
            productListView.products = filtered
        } else {
            productListView.products = products
        }
        productListView.collectionView.reloadData()
    }
}
