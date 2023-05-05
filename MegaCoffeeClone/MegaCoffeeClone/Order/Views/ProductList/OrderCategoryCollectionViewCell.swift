//
//  CategoryCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderCategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    // MARK: [Override] ----------
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
    }
}

