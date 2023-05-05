//
//  OrderDetailTVC3.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/30.
//

import Foundation
import UIKit

class OrderDetailTVC3: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    
    // MARK: Left
    lazy var stackView1: UIStackView = {
        let stack1 = UIStackView()
        
        stack1.axis = .vertical
        stack1.distribution = .fillEqually
        
        return stack1
    }()
    
    
    lazy var leftLabel1: UILabel = {
        let left1 = UILabel()
        
        left1.text = "결제수단"
        left1.textAlignment = .left
        left1.font = .systemFont(ofSize: 15, weight: .light)
        
        return left1
    }()
    
    lazy var leftLabel2: UILabel = {
        let left2 = UILabel()
        
        left2.text = "상품금액"
        left2.textAlignment = .left
        left2.font = .systemFont(ofSize: 15, weight: .light)
        
        return left2
    }()
    
    lazy var leftLabel3: UILabel = {
        let left3 = UILabel()
        
        left3.text = "할인금액"
        left3.textAlignment = .left
        left3.font = .systemFont(ofSize: 15, weight: .light)
        
        return left3
    }()
    
    lazy var leftLabel4: UILabel = {
        let left4 = UILabel()
        
        left4.text = "결제금액"
        left4.textAlignment = .left
        left4.font = .systemFont(ofSize: 15, weight: .light)
        
        return left4
    }()
    
    
    
    
    
    
    
    // MARK: Right
    lazy var stackView2: UIStackView = {
       let stack2 = UIStackView()
        
        stack2.axis = .vertical
        stack2.distribution = .fillEqually
        
        return stack2
    }()
    
    
    lazy var rightLabel1: UILabel = {
        let right1 = UILabel()
        
        //
        right1.text = "신용카드"
        right1.textAlignment = .right
        right1.font = .systemFont(ofSize: 15, weight: .light)
        
        return right1
    }()
    
    lazy var rightLabel2: UILabel = {
        let right2 = UILabel()
        
        // 가격 -> Week1Model.priceLabel
        right2.text = "3,900원"
        right2.textAlignment = .right
        right2.font = .systemFont(ofSize: 15, weight: .light)
        
        return right2
    }()
    
    lazy var rightLabel3: UILabel = {
        let right3 = UILabel()
        
        right3.text = "-0원"
        right3.textAlignment = .right
        right3.font = .systemFont(ofSize: 15, weight: .light)
        
        return right3
    }()
    
    lazy var rightLabel4: UILabel = {
        let right4 = UILabel()
        
        // 가격 -> Week1Model.priceLabel
        right4.text = "3,900원"
        right4.textAlignment = .right
        right4.font = .systemFont(ofSize: 20, weight: .semibold)
        right4.textColor = .systemPink
        
        return right4
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
        self.contentView.addSubview(self.stackView1)
        self.stackView1.addArrangedSubview(self.leftLabel1)
        self.stackView1.addArrangedSubview(self.leftLabel2)
        self.stackView1.addArrangedSubview(self.leftLabel3)
        self.stackView1.addArrangedSubview(self.leftLabel4)
        
        
        
        
        self.contentView.addSubview(self.stackView2)
        self.stackView2.addArrangedSubview(self.rightLabel1)
        self.stackView2.addArrangedSubview(self.rightLabel2)
        self.stackView2.addArrangedSubview(self.rightLabel3)
        self.stackView2.addArrangedSubview(self.rightLabel4)
        
    }
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutStackView1()
        layoutStackView2()

    }
    
    
    func layoutStackView1() {
        self.stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stackView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            self.stackView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
    
    func layoutStackView2() {
        self.stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView2.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stackView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.stackView2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            self.stackView2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
            
        ])
    }
    
    
}

