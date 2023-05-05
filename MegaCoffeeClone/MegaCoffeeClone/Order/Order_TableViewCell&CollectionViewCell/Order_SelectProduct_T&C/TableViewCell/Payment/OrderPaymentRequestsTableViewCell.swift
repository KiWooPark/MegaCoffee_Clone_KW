//
//  OrderRequestsTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/14.
//

import UIKit

protocol OrderPaymentRequestsTableViewCellDelegate {
    func changeSelectButton()
}

class OrderPaymentRequestsTableViewCell: UITableViewCell {

    @IBOutlet var requestTextView: UITextView!
    
    @IBOutlet var optionButtons: [UIButton]!
  
    var delegate: OrderPaymentRequestsTableViewCellDelegate?
    var isSelecteds = [Bool]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        requestTextView.layer.borderColor = UIColor.darkGray.cgColor
        requestTextView.layer.borderWidth = 1
        requestTextView.layer.cornerRadius = 10
        
        setup()
    }
    
    func setup() {
        isSelecteds = [true,false]
        
        optionButtons[0].tintColor = .black
        optionButtons[1].tintColor = .systemGray4
        
        optionButtons[0].setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        optionButtons[1].setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    
    @IBAction func tapOptionButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        for index in 0..<optionButtons.count {
            
            isSelecteds[index] = index == button.tag ? true : false
            
            if isSelecteds[index] == true {
                optionButtons[index].tintColor = .black
                optionButtons[index].setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            } else {
                optionButtons[index].tintColor = .systemGray4
                optionButtons[index].setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
}
