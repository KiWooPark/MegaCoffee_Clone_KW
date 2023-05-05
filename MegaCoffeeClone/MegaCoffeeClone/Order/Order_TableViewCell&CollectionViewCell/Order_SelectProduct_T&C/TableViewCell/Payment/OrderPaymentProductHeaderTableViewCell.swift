//
//  OrderPaymentProductHeaderTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/14.
//

import UIKit

protocol OrderPaymentProductHeaderTableViewCellDelegate {
    func expandProductSection(isOpen: Bool)
}

class OrderPaymentProductHeaderTableViewCell: UITableViewCell {

    @IBOutlet var openAndCloseButton: UIButton!
    
    var delegate: OrderPaymentProductHeaderTableViewCellDelegate?
    var isOpen = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func tapOpenAndCloseButton(_ sender: Any) {
        
        isOpen.toggle()
        delegate?.expandProductSection(isOpen: isOpen)
    }
    

}
