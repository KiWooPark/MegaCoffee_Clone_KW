//
//  OrderDetailTVC2.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/30.
//

import Foundation
import UIKit

class OrderDetailTVC2: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        
        img.backgroundColor = .systemGray4
        
        return img
    }()
    
    
    
    
    
    
    // MARK: [Center]
    
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        return stackView
    }()
    
    
    lazy var menuLabel: UILabel = {
        let menu = UILabel()
        
        // 메뉴이름 -> Week1Model.menuLabel
        menu.text = "망고요거트스무디"
        menu.font = .systemFont(ofSize: 15, weight: .light)
        
        return menu
    }()
    
    lazy var countLabel: UILabel = {
        let count = UILabel()
        
        // 수량 -> Week1Model.menuCountLabel
        count.text = "1개"
        count.font = .systemFont(ofSize: 18, weight: .light)
        
        
        return count
    }()
    
    
    
    // MARK: [Price]
    
    lazy var priceLabel: UILabel = {
        let price = UILabel()
        
        // 가격 -> Week1Model.priceLabel
        price.text = "3,900원"
        price.textAlignment = .center
        price.font = .systemFont(ofSize: 18, weight: .medium)
        
        return price
        
        
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
        self.addSubview(self.imgView)
        
        self.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.menuLabel)
        self.stackView.addArrangedSubview(self.countLabel)
        
        self.addSubview(self.priceLabel)
        
    }
    
    
    
    // MARK: [Layout - Total]
    
    
    func layout() {
        layoutImgView()

        layoutStackView()
        
        layoutPriceLabel()
    }
    
    
    
    func layoutImgView() {
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.imgView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
            
        ])

    }
    

    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stackView.leadingAnchor.constraint(equalTo: self.imgView.trailingAnchor, constant: 10),
            self.stackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
            self.stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
            
        ])
    }
    
    func layoutPriceLabel() {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
            
        ])
    }
    
    
    
    
}

