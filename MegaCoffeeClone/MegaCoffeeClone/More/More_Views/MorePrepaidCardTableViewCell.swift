//
//  MorePrepaidCardTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit


class MorePrepaidCardTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    // MARK: [변수 선언]
    let tableLabel : UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 15, weight: .regular)
            return label
        }()
    
    
    lazy var textView = UITextView()
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        addSubview(tableLabel)
    }
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutTitleLabel()
    }
    
    
    
    func layoutTitleLabel() {
        tableLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.tableLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
    }
    

}
