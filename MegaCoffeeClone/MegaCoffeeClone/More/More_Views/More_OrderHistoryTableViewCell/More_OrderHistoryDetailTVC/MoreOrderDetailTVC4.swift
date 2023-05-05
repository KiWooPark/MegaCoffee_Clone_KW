//
//  OrderDetailTVC4.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/30.
//

import Foundation
import UIKit

class OrderDetailTVC4: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    lazy var stampLabel: UILabel = {
        let stamp = UILabel()
        
        stamp.text = "스탬프 적립"
        stamp.textAlignment = .left
        stamp.font = .systemFont(ofSize: 15, weight: .light)
        
        return stamp
    }()
    
    
    lazy var countLabel: UILabel = {
        let count = UILabel()
        
        // 수량 -> Week1Model.menuCountLabel
        count.text = "1개"
        count.textAlignment = .right
        count.font = .systemFont(ofSize: 15, weight: .light)
        
        return count
        
    }()
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.stampLabel)
        self.contentView.addSubview(self.countLabel)
        
    }
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutStampLabel()
        layoutCountLabel()

    }
    
    
    func layoutStampLabel() {
        self.stampLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stampLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stampLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stampLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.stampLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
    
    func layoutCountLabel() {
        self.countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.countLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        ])
    }
    
    
}

