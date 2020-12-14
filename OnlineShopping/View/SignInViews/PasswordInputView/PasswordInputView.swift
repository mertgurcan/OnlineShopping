//
//  PasswordInputView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 13.12.2020.
//

import UIKit

class PasswordInputView: UIView {

    @IBOutlet weak var backgroundView: UIView!
    
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
        let viewFromXib = Bundle.main.loadNibNamed("PasswordInputView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    func updateUI(){
        backgroundView.layer.cornerRadius = 25
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.13
        backgroundView.layer.shadowOffset = .zero
        backgroundView.layer.shadowRadius = 6
    }
}
