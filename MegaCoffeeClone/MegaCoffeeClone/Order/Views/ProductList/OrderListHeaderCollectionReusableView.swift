//
//  OrderListHeaderCollectionReusableView.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

// MARK: [Protocol] ----------
protocol OrderListHeaderCollectionReusableViewDelegate: AnyObject {
    func changeColumn()
}

class OrderListHeaderCollectionReusableView: UICollectionReusableView {
        
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var changeColumnButton: UIButton!
    
    // MARK: [Let Or Var] ----------
    weak var delegate: OrderListHeaderCollectionReusableViewDelegate?
    
    // MARK: [@IBAction] ----------
    @IBAction func tapChangeColumnButton(_ sender: Any) {
        delegate?.changeColumn()
    }
}




