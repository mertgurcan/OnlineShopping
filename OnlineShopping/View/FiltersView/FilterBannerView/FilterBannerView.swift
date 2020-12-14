//
//  FilterBannerView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 14.12.2020.
//

import UIKit

class FilterBannerView: UIView {
    @IBOutlet weak var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("FilterBannerView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
}
