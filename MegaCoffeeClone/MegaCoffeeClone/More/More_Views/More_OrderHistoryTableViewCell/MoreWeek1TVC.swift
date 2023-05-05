//
//  Week1TVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/23.
//


import Foundation
import UIKit

class MoreWeek1TVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    // MARK: [변수 선언] [0]
    lazy var stateLabel: UILabel = {
       let top = UILabel()
        
        top.font = .systemFont(ofSize: 16, weight: .regular)
        
        return top
    }()
    
    lazy var storeLabel: UILabel = {
       let main = UILabel()
        
        main.font = .systemFont(ofSize: 19, weight: .regular)
        
        return main
    }()
    
    
    
    // MARK: [변수 선언] [1]
    
    lazy var menuLabel: UILabel = {
       let menu = UILabel()
        
        menu.setting()
        
        return menu
    }()
    
    lazy var menuCountLabel: UILabel = {
        let count = UILabel()
        
        count.setting()
        
        return count
    }()
    
    lazy var centerLabel: UILabel = {
       let center = UILabel()
        
        center.setting()
        center.textColor = .gray
        
        return center
    }()
    
    lazy var dateLabel: UILabel = {
       let date = UILabel()
        
        date.setting()
        
        return date
    }()
    
    
   
    
    
    
    
    
    
 // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.backgroundColor = .systemBackground
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.stateLabel)
        self.contentView.addSubview(self.storeLabel)
        
        self.contentView.addSubview(self.menuLabel)
        self.contentView.addSubview(self.menuCountLabel)
        self.contentView.addSubview(self.centerLabel)
        self.contentView.addSubview(self.dateLabel)
        
    }
    
    // MARK: [Layout - Total]
    func layout() {
        
        layoutStateLabel()
        layoutStoreLabel()
        
        layoutMenuLabel()
        layoutMenuCountLabel()
        layoutCenterLabel()
        layoutDateLabel()
    }
    
    // StateLabel
    func layoutStateLabel() {
        self.stateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stateLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.stateLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor),
            self.stateLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor),
            self.stateLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    // StoreLabel
    func layoutStoreLabel() {
        self.storeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.storeLabel.topAnchor.constraint(equalTo: self.stateLabel.bottomAnchor),
            self.storeLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor),
            self.storeLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor),
            self.storeLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.3)
            
        ])

    }

    
    
    
    
    // MenuLabel
    func layoutMenuLabel() {
        self.menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.menuLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor),
            self.menuLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.menuLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            self.menuLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
        ])

    }
    
    // MenuCountLabel
    func layoutMenuCountLabel() {
        self.menuCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.menuCountLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor),
            self.menuCountLabel.leadingAnchor.constraint(equalTo: self.menuLabel.trailingAnchor, constant: 5),
            self.menuCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            self.menuCountLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)

          
        ])
    }
    
    
    
    // CenterLabel
    func layoutCenterLabel() {
        self.centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.centerLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor),
            self.centerLabel.leadingAnchor.constraint(equalTo: self.menuCountLabel.trailingAnchor, constant: 10),
            self.centerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            self.centerLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)

          
        ])
    }
    
    
    
    
    // DateLabel
    func layoutDateLabel() {
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor),
            self.dateLabel.leadingAnchor.constraint(equalTo: self.centerLabel.trailingAnchor, constant: 10),
            self.dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            self.dateLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
          
        ])
    }
    

    
}


// MARK: [Extension - UILabel]
extension UILabel {
    
    func setting() {
        self.textAlignment = .left
        self.font = .systemFont(ofSize: 13, weight: .regular)
    }
    
}
