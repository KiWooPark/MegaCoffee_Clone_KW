//
//  OrderDetail1TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderMenuDetailTableViewCell: UITableViewCell {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var soldOutView: UIView!
    @IBOutlet weak var soldOutLabel: UILabel!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuDescriptionLabel: UILabel!
    
    // MARK: [Override] ----------
    override func prepareForReuse() {
        super.prepareForReuse()
        
        soldOutView.isHidden = false
        soldOutLabel.isHidden = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = soldOutView.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: [Function] ----------
    func configSoldOutView(isSoldOut: Bool) {
        if isSoldOut {
            soldOutView.isHidden = false
            soldOutLabel.isHidden = false
        } else {
            soldOutView.isHidden = true
            soldOutLabel.isHidden = true
        }
    }

    func configData(menuData: Menu1.MenuModel1) {
        menuImageView.image = UIImage(named: menuData.image ?? "")
        menuNameLabel.text = menuData.name ?? ""
        menuDescriptionLabel.text = menuData.description ?? ""
        soldOutView.isHidden = menuData.soldOut ?? false ? false : true
        soldOutLabel.isHidden = menuData.soldOut ?? false ? false : true
    }
}
