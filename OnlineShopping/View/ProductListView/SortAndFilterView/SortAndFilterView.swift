//
//  SortAndFilterView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 13.12.2020.
//

import UIKit

class SortAndFilterView: UIView {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        updateUI()

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        updateUI()

    }

    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("SortAndFilterView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    func updateUI(){
        backgroundView.layer.cornerRadius = 25
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.05
        backgroundView.layer.shadowOffset = CGSize(width: 0,height: 6)
        backgroundView.layer.shadowRadius = 3
        sortButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        filterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    }
}
