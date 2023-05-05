//
//  OrderPaymentListTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/14.
//

import UIKit

protocol OrderPaymentListTableViewCellDelegate {
    func reloadCell()
}

class OrderPaymentListTableViewCell: UITableViewCell {

    @IBOutlet var megaCardView: UIView!
    @IBOutlet var easyCardView: UIView!
    
    @IBOutlet var optionButtons: [UIButton]!
    
    var isSelecteds = [Bool]()
    var delegate: OrderPaymentListTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        easyCardView.isHidden = true
        setup()
        
    }
    
    func setup() {
        isSelecteds = [true,false,false,false,false,false]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapPaymentButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
       
        
        for index in 0..<isSelecteds.count {
            isSelecteds[index] = index == button.tag ? true : false
            
            if isSelecteds[index] == true {
                if index == 0 {
                    megaCardView.isHidden = false
                    easyCardView.isHidden = true
                } else if index == 2 {
                    megaCardView.isHidden = true
                    easyCardView.isHidden = false
                } else {
                    megaCardView.isHidden = true
                    easyCardView.isHidden = true
                }
                
                optionButtons[index].tintColor = .black
                optionButtons[index].setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            } else {
                optionButtons[index].tintColor = .systemGray2
                optionButtons[index].setImage(UIImage(systemName: "circle"), for: .normal)
            }
            
            delegate?.reloadCell()
        }
    }
}
