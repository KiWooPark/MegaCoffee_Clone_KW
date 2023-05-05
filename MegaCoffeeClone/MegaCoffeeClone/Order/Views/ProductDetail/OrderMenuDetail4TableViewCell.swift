//
//  OrderDetail4TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

// MARK: [Protocol] ----------
protocol OrderMenuDetail4TableViewCellDelegate: AnyObject {
    func changeSection4(index: Int)
    func putShoppingBasket()
}

// MARK: [Class or Struct] ----------
class OrderMenuDetail4TableViewCell: UITableViewCell {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var menuImageView1: UIImageView!
    @IBOutlet weak var menuImageView2: UIImageView!
    @IBOutlet weak var menuImageView3: UIImageView!
    
    @IBOutlet weak var menuNameLabel1: UILabel!
    @IBOutlet weak var menuNameLabel2: UILabel!
    @IBOutlet weak var menuNameLabel3: UILabel!
    
    @IBOutlet weak var menuPriceLabel1: UILabel!
    @IBOutlet weak var menuPriceLabel2: UILabel!
    @IBOutlet weak var menuPriceLabel3: UILabel!
    
    @IBOutlet weak var menuSelectButton1: UIButton!
    @IBOutlet weak var menuSelectButton2: UIButton!
    @IBOutlet weak var menuSelectButton3: UIButton!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var doneButtonAndShoppingButtonStackView: UIStackView!

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var shoppingbasketButton: UIButton!
    @IBOutlet weak var soldOutButton: UIButton!
    
    // MARK: [Let Or Var] ----------
    weak var delegate: OrderMenuDetail4TableViewCellDelegate?
    
    // MARK: [Override] ----------
    override func prepareForReuse() {
        super.prepareForReuse()
        
        menuSelectButton1.setImage(UIImage(systemName: "circle"), for: .normal)
        menuSelectButton2.setImage(UIImage(systemName: "circle"), for: .normal)
        menuSelectButton3.setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doneButton.layer.cornerRadius = 10
        shoppingbasketButton.layer.cornerRadius = 10
        soldOutButton.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: [@IBAction] ----------
    @IBAction func tapMenuSelectButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.changeSection4(index: button.tag)
    }
    
    
    @IBAction func tapDoneButton(_ sender: Any) {
        print("11")
    
    }
    
    @IBAction func tapShoppingBasketButton(_ sender: Any) {
        // 장바구니에 담기만 하면 됨
        delegate?.putShoppingBasket()
        
    }
    
    @IBAction func tapSoldOutButton(_ sender: Any) {
        print("33")
    }
    
    // MARK: [Function] ----------
    func configData(data: [RecomendMenuModel]?, sum: Int) {
        menuImageView1.image = UIImage(named: data?[0].image ?? "")
        menuImageView2.image = UIImage(named: data?[1].image ?? "")
        menuImageView3.image = UIImage(named: data?[2].image ?? "")
        
        menuNameLabel1.text = data?[0].name ?? ""
        menuNameLabel2.text = data?[1].name ?? ""
        menuNameLabel3.text = data?[2].name ?? ""
        
        menuPriceLabel1.text = "\(data?[0].price ?? 0)원"
        menuPriceLabel2.text = "\(data?[1].price ?? 0)원"
        menuPriceLabel3.text = "\(data?[2].price ?? 0)원"
        
        sumLabel.text = "\(sum)원"
    }
    
    func configLayout(isSoldOut: Bool, indexs: [Bool]) {
        if isSoldOut {
            doneButtonAndShoppingButtonStackView.isHidden = true
        } else {
            soldOutButton.isHidden = true
        }
        
        indexs[0] == true ? menuSelectButton1.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal) : menuSelectButton1.setImage(UIImage(systemName: "circle"), for: .normal)
        indexs[1] == true ? menuSelectButton2.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal) : menuSelectButton2.setImage(UIImage(systemName: "circle"), for: .normal)
        indexs[2] == true ? menuSelectButton3.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal) : menuSelectButton3.setImage(UIImage(systemName: "circle"), for: .normal)
    }
}
