//
//  OrderShoppigBasketListTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/29.
//

import UIKit

protocol OrderShoppingBasketListTableViewCellDelegate {
    func deleteMenu(index: Int)
    func minusMenuCount(index: Int)
    func plusMenuCount(index: Int)
}

class OrderShoppingBasketListTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuOptionLabel: UILabel!
    @IBOutlet weak var menuCountLabel: UILabel!
    @IBOutlet weak var menuTotalPriceLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var delegate: OrderShoppingBasketListTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        menuOptionLabel.isHidden = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(menu: ShoppingBasketModel) {
        menuImageView.image = UIImage(named: menu.productImage)
        menuNameLabel.text = menu.productName
        
        if menu.options.isEmpty {
            menuOptionLabel.isHidden = true
        } else {
            menuOptionLabel.text = menu.options.joined(separator: " x1\n")
        }
       
        menuCountLabel.text = "\(menu.count)"
        menuTotalPriceLabel.text = "\(menu.price * menu.count)원"
    }
    
    @IBAction func tapDeleteButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.deleteMenu(index: button.tag)
        
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.minusMenuCount(index: button.tag)
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.plusMenuCount(index: button.tag)
    }
}
