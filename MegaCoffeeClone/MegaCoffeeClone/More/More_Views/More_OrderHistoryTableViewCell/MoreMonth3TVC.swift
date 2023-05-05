//
//  Month3TVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/23.
//

import Foundation
import UIKit

class MoreMonth3TVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
}

