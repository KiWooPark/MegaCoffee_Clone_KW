//
//  OrderCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/23.
//


import Foundation
import UIKit

class MoreOrderCustomHeaderView: UITableViewHeaderFooterView {
    
    
    // MARK: [변수 선언] [1]: Week1
    lazy var week1Button: UIButton = {
        let week1 = UIButton(type: .system)
        week1.tag = 1
        
        week1.colorSetting()
        
        week1.addTarget(self, action: #selector(week1ButtonTapped(_sender:)), for: .touchUpInside)
        
        return week1
    }()
    
    
    // MARK: [변수 선언] [2]: Month1
    lazy var month1Button: UIButton = {
        let month1 = UIButton(type: .system)
        month1.tag = 2
        
        month1.noneSetting()
        
        month1.addTarget(self, action: #selector(month1ButtonTapped(_sender:)), for: .touchUpInside)
        
        return month1
    }()
    
    
    // MARK: [변수 선언] [3]: Month3
    lazy var month3Button: UIButton = {
        let month3 = UIButton(type: .system)
        month3.tag = 3
        
        month3.noneSetting()
        
        month3.addTarget(self, action: #selector(month3ButtonTapped(_sender:)), for: .touchUpInside)
        
        return month3
    }()
    
    
    // MARK: [변수 선언] [4]: Total
    lazy var totalButton: UIButton = {
        let total = UIButton(type: .system)
        total.tag = 4
        
        total.noneSetting()
        
        total.addTarget(self, action: #selector(totalButtonTapped(_sender:)), for: .touchUpInside)
        
        return total
    }()
    
    
    
    // MARK: [변수 선언] [5]: StackView
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 13
        
        return stackView
    }()
    
    
    
    
    
    
    // MARK: [Override]
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
               
        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    
    
    
    // MARK: [Action]
    @objc func week1ButtonTapped(_sender: UIButton) {
        week1Button.colorSetting()
        
        month1Button.noneSetting()
        month3Button.noneSetting()
        totalButton.noneSetting()
    }
    
    
    @objc func month1ButtonTapped(_sender: UIButton) {
        month1Button.colorSetting()
        
        week1Button.noneSetting()
        month3Button.noneSetting()
        totalButton.noneSetting()
    }
    

    @objc func month3ButtonTapped(_sender: UIButton) {
        month3Button.colorSetting()
        
        week1Button.noneSetting()
        month1Button.noneSetting()
        totalButton.noneSetting()
    }
    
    
    @objc func totalButtonTapped(_sender: UIButton) {
        totalButton.colorSetting()
        
        week1Button.noneSetting()
        month1Button.noneSetting()
        month3Button.noneSetting()
    }
    
    
    
    
    
   
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.stackView)

        self.stackView.addArrangedSubview(self.week1Button)
        self.stackView.addArrangedSubview(self.month1Button)
        self.stackView.addArrangedSubview(self.month3Button)
        self.stackView.addArrangedSubview(self.totalButton)
    }
    
    
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutStackView()
    }
    
    
    // StackView
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }
    
}





// MARK: [UIButton - Extension]
extension UIButton {
    
    
    func colorSetting() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        
        self.layer.borderColor = UIColor.black.cgColor
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        self.backgroundColor = .black
    }
    
    func noneSetting() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        
        self.layer.borderColor = UIColor.systemGray3.cgColor
        
        self.setTitleColor(UIColor.gray, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        self.backgroundColor = .white
    }
    
    
}
