//
//  MemberInformationManagementTableViewCell.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import Foundation
import UIKit

class MoreMemberInfoManagementTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
}




