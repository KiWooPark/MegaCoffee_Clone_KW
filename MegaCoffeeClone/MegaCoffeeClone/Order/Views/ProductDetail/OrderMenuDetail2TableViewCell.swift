//
//  OrderDetail2TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

// MARK: [Protocol] ----------
protocol OrderMenuDetail2TableViewCellDelegate: AnyObject {
    func changeSection2(row: Int, buttonIndex: Int)
    func updateCount(row: Int, index: Int, count: Int)
}

// MARK: [Class or Struct] ----------
class OrderMenuDetail2TableViewCell: UITableViewCell {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var optionTitleLabel: UILabel!
    
    @IBOutlet var optionViews: [UIView]!
    @IBOutlet var optionButtons: [UIButton]!
    @IBOutlet var countStackViews: [UIStackView]!
    @IBOutlet var countLabels: [UILabel]!
    @IBOutlet var priceLables: [UILabel]!
    
    // MARK: [Let Or Var] ----------
    var row = 0
    var totalCount = 0
    var selectedCount = 0
    var optionData: Menu1.MenuModel1.OptionModel1?
    weak var delegate: OrderMenuDetail2TableViewCellDelegate?
    
    // MARK: [Override] ----------
    override func prepareForReuse() {
        super.prepareForReuse()
        
        optionViews.forEach { view in
            view.isHidden = false
        }
        
        optionButtons.forEach { button in
            button.isHidden = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        optionButtons[0].layoutIfNeeded()
        optionButtons[1].layoutIfNeeded()
        optionButtons[2].layoutIfNeeded()
        optionButtons[3].layoutIfNeeded()
        optionButtons[4].layoutIfNeeded()
        optionButtons[5].layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: [@IBAction] ----------
    @IBAction func tapOptionButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        for i in 0..<(optionData?.details?.count ?? 0) {
            optionButtons[i].setImage(UIImage(systemName: "circle"), for: .normal)
            optionButtons[i].tintColor = .lightGray
            optionData?.details?[i].isSelect = false
        }
        
        optionButtons[button.tag].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        optionButtons[button.tag].tintColor = .black
        optionData?.details?[button.tag].isSelect = true
        
        delegate?.changeSection2(row: row, buttonIndex: button.tag)
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let count = Int(countLabels[button.tag].text ?? "") ?? 0
        
        if count > 1 {
            countLabels[button.tag].text = "\(count - 1)"
            selectedCount -= 1
        }
        delegate?.updateCount(row: row, index: button.tag, count: Int(countLabels[button.tag].text ?? "") ?? 0)
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let count = Int(countLabels[button.tag].text ?? "") ?? 0
        
        if selectedCount == totalCount {
            print("그만")
        } else {
            countLabels[button.tag].text = "\(count + 1)"
            selectedCount += 1
        }
        delegate?.updateCount(row: row, index: button.tag, count: Int(countLabels[button.tag].text ?? "") ?? 0)
    }
    
    // MARK: [Function] ----------
    func configOptionButton(optionData: Menu1.MenuModel1.OptionModel1) {

        self.optionData = optionData
        
        optionTitleLabel.text = optionData.header ?? ""

        for i in 0 ... 5 {
            if i < optionData.details?.count ?? 0 {
                optionButtons[i].setTitle(optionData.details?[i].name, for: .normal)
                if optionData.details?[i].isSelect ?? false {
                    optionButtons[i].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
                    optionButtons[i].tintColor = .black
                } else {
                    optionButtons[i].setImage(UIImage(systemName: "circle"), for: .normal)
                    optionButtons[i].tintColor = .lightGray
                }
                
                if optionData.details?[i].price ?? 0 != 0 {
                    priceLables[i].text = "+\(optionData.details?[i].price ?? 0)원"
                }
            } else {
                optionViews[i].isHidden = true
            }
        }
    }
}



