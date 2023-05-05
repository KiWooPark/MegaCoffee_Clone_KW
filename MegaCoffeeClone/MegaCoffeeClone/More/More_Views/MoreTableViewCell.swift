//
//  TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/13.
//

import Foundation
import UIKit

class MoreTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
}
