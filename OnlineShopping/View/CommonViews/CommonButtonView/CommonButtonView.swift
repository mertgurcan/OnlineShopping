//
//  CommonButtonView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 13.12.2020.
//

import UIKit

class CommonButtonView: UIView {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var buttonView: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("CommonButtonView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    func updateUI(color: UIColor , text: String){
        backgroundView.backgroundColor = color
        buttonView.setTitle(text, for: .normal)
        backgroundView.layer.cornerRadius = 25
    }
}
