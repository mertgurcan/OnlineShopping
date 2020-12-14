//
//  TableViewCell.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 14.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
