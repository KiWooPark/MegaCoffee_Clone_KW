//
//  OrderMoreButtonTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

protocol OrderMoreProductsButtonTableViewCellDelegate: AnyObject {
    func fetchPagingProducts()
}

class OrderMoreProductsButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var moreButton: UIButton!
    
    weak var delegate: OrderMoreProductsButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapMoreButton(_ sender: Any) {
        delegate?.fetchPagingProducts()
    }
}
