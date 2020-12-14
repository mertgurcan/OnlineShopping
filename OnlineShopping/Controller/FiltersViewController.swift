//
//  FiltersViewController.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 12.12.2020.
//

import UIKit

protocol PassCategoryBack {
    func passCategory(category: String)
}

class FiltersViewController: UIViewController {

    var categories : [String]?
    var delegate : PassCategoryBack!

    @IBOutlet weak var categoryTableView: CategoryTableView!
    @IBOutlet weak var filterBannerView: FilterBannerView!
    @IBOutlet weak var filterButton: CommonButtonView!

    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTableView.categories = categories
        categoryTableView.categoryTableView.tableFooterView =  UIView()
        filterButton.updateUI(color: UIColor(red: 0.99, green: 0.75, blue: 0.00, alpha: 1.00), text: "Filtrele")
        filterButton.buttonView.addTarget(self, action: #selector(goBackToProductListViewController(_:)), for: .touchUpInside)
        filterBannerView.closeButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func goBackToProductListViewController(_ sender : UIButton){
        delegate.passCategory(category: categoryTableView.selectedCategory)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func goBack(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    

}
