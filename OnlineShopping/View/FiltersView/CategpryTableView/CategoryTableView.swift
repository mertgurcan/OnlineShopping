//
//  CategoryTableView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 14.12.2020.
//

import UIKit

class CategoryTableView: UIView , UITableViewDataSource, UITableViewDelegate {

    var categories: [String]?
    var selectedCategory = ""

    @IBOutlet weak var categoryTableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initTableView()

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        initTableView()
    }

    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("CategoryTableView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

    func initTableView(){
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        categoryTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! TableViewCell
        cell.categoryName.text = categories![indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories![indexPath.row]
    }
}
