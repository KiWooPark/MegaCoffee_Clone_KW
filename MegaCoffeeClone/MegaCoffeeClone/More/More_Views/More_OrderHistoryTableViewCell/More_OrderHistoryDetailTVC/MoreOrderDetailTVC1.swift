//
//  OrderDetailTVC1.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/30.
//

import Foundation
import UIKit

class OrderDetailTVC1: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    
    // MARK: [1]
    lazy var topLabel: UILabel = {
        let top = UILabel()
        
        top.backgroundColor = UIColor.darkGray
        top.textColor = .white
        
        
        top.numberOfLines = 0
        top.font = .systemFont(ofSize: 16)
        
        top.text = "1시간 이내에 찾아가지 않으실 경우\n품질 및 보관 문제로 폐기 될 수 있습니다."
        top.textAlignment = .center
        top.layer.cornerRadius = 10
        
        top.clipsToBounds = true
        
        return top
    }()
    
    
    // MARK: [2]
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var label1: UILabel = {
       let label1 = UILabel()
        
        // 지점 -> store Label
        // label1.text = "광명GIDC점"
        label1.textAlignment = .center
        
        return label1
    }()
    
    lazy var label2: UILabel = {
       let label2 = UILabel()
        
        // 주문번호 -> Week1Model.orderNumberLabel
        // label2.text = "주문번호 : 0002"
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 22, weight: .medium)
        
        return label2
    }()
    
    
    lazy var label3: UILabel = {
       let label3 = UILabel()
        
        // 날짜와 시간 -> Week1Model.detailDateLabel
        // label3.text = "2022. 10. 26. 08:53"
        label3.textAlignment = .center
        label3.font = .systemFont(ofSize: 14, weight: .light)
        label3.textColor = .label
        
        return label3
    }()
    
    
    
    
    // MARK: [bottom]
    lazy var testView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        
        return stackView
    }()
    
    lazy var label21: UILabel = {
       let label1 = UILabel()
        
        label1.text = "결제완료"
        label1.textAlignment = .left
        label1.font = .systemFont(ofSize: 13, weight: .light)
        
        return label1
    }()
    
    lazy var label22: UILabel = {
       let label2 = UILabel()
        
        label2.text = "주문확인"
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 13, weight: .light)
        
        return label2
    }()
    
    
    lazy var label23: UILabel = {
       let label3 = UILabel()
        
        label3.text = "제조완료"
        label3.textAlignment = .right
        label3.font = .systemFont(ofSize: 13, weight: .light)
        
        return label3
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
        self.contentView.addSubview(self.topLabel)
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.label1)
        self.stackView.addArrangedSubview(self.label2)
        self.stackView.addArrangedSubview(self.label3)
        
        
        self.contentView.addSubview(self.testView)
        self.contentView.addSubview(self.stackView2)
        
        self.stackView2.addArrangedSubview(self.label21)
        self.stackView2.addArrangedSubview(self.label22)
        self.stackView2.addArrangedSubview(self.label23)
    }
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutTopLabel()
        layoutStackView()
        
        layoutTestView()
        layoutStackView2()
    }
    
    func layoutTopLabel() {
        self.topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.topLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.stackView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    func layoutTestView() {
        self.testView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.testView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20),
            self.testView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.testView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.testView.heightAnchor.constraint(equalToConstant: 10)
            
        ])
    }
    
    func layoutStackView2() {
        self.stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            self.stackView2.topAnchor.constraint(equalTo: self.testView.bottomAnchor, constant: 10),
            self.stackView2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.stackView2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.stackView2.heightAnchor.constraint(equalToConstant: 15)
            
        ])
    }
    
    
    
}

