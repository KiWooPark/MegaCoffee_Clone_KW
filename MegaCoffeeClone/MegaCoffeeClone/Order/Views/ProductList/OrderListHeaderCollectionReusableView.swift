//
//  OrderListHeaderCollectionReusableView.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

protocol OrderListHeaderCollectionReusableViewDelegate {
    func changeColumn()
}

class OrderListHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var changeColumnButton: UIButton!
    
    var delegate: OrderListHeaderCollectionReusableViewDelegate?
    
    
    @IBAction func tapChangeColumnButton(_ sender: Any) {
        delegate?.changeColumn()
    }
}
