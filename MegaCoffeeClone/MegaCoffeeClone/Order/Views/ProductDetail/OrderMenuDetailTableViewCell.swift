//
//  OrderDetail1TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

class OrderMenuDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var soldOutView: UIView!
    @IBOutlet weak var soldOutLabel: UILabel!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuDescriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        soldOutView.isHidden = false
        soldOutLabel.isHidden = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = soldOutView.frame.height / 2
    }

    func configSoldOutView(isSoldOut: Bool) {
        if isSoldOut {
            soldOutView.isHidden = false
            soldOutLabel.isHidden = false
        } else {
            soldOutView.isHidden = true
            soldOutLabel.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(menuData: Menu1.MenuModel1) {
        menuImageView.image = UIImage(named: menuData.image ?? "")
        menuNameLabel.text = menuData.name ?? ""
        menuDescriptionLabel.text = menuData.description ?? ""
        soldOutView.isHidden = menuData.soldOut ?? false ? false : true
        soldOutLabel.isHidden = menuData.soldOut ?? false ? false : true
    }
}
