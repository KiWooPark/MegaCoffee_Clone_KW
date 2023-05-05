//
//  MoreCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//


import Foundation
import UIKit

class MoreCustomHeaderView: UITableViewHeaderFooterView {
    

    // MARK: [변수 선언] [1]: Button
    lazy var eventButton: UIButton = {
        let event = UIButton(type: .system)
        event.tag = 1
        
        event.setTitleColor(UIColor.black, for: .normal)
        event.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        event.addTarget(self, action: #selector(eventButtonTapped(_sender:)), for: .touchUpInside)
        
        return event
    }()
    
    
    lazy var noticeButton: UIButton = {
        let notice = UIButton(type: .system)
        notice.tag = 2

        notice.setTitleColor(UIColor.black, for: .normal)
        notice.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        notice.addTarget(self, action: #selector(noticeButtonTapped(_sender:)), for: .touchUpInside)
        
        return notice
        
    }()
    
    
    lazy var rankingEventButton: UIButton = {
        let ranking = UIButton(type: .system)
        ranking.tag = 3
        
        ranking.setTitleColor(UIColor.black, for: .normal)
        ranking.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        ranking.addTarget(self, action: #selector(rankingButtonTapped(_sender:)), for: .touchUpInside)
        
        return ranking
        
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    
    // MARK: [변수 선언] [2]: underBar
    lazy var eventUnderBar: UIView = {
        let bar = UIView()

        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    lazy var noticeUnderBar: UIView = {
        let bar = UIView()
        
        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    lazy var rankingUnderBar: UIView = {
        let bar = UIView()
        
        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    
    
    // MARK: [변수 선언] [3]: Bottom
    lazy var bottomLine = UIView()
    
    
    
    
    
    
    
    // MARK: [Override]
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        

        eventUnderBar.isHidden = false
        noticeUnderBar.isHidden = true
        rankingUnderBar.isHidden = true

        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    
    
    
    
    
    // MARK: [Action]
    @objc func eventButtonTapped(_sender: UIButton) {
        
        eventUnderBar.isHidden = false
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        noticeUnderBar.isHidden = true
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        rankingUnderBar.isHidden = true
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    @objc func noticeButtonTapped(_sender: UIButton) {
        
        eventUnderBar.isHidden = true
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        noticeUnderBar.isHidden = false
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        rankingUnderBar.isHidden = true
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    @objc func rankingButtonTapped(_sender: UIButton) {
        
        eventUnderBar.isHidden = true
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        noticeUnderBar.isHidden = true
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        rankingUnderBar.isHidden = false
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    
    
    
    
    
    
    
    // MARK: [Layout]
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        
        self.contentView.addSubview(self.eventUnderBar)
        self.contentView.addSubview(self.noticeUnderBar)
        self.contentView.addSubview(self.rankingUnderBar)
        
        self.contentView.addSubview(self.bottomLine)
        
        
        self.stackView.addArrangedSubview(self.eventButton)
        self.stackView.addArrangedSubview(self.noticeButton)
        self.stackView.addArrangedSubview(self.rankingEventButton)
    }
    
    
    
    
    
    
    func layout() {
        layoutStackView()
        
        layoutEventUnderBar()
        layoutNoticeUnderBar()
        layoutRankingUnderBar()
        
        layoutBottomLine()
    }
    
    
    // Button StackView
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7),
            self.stackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.99)
            ])
    }
    
    // Event Button UnderBar
    func layoutEventUnderBar() {
        self.eventUnderBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.eventUnderBar.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            self.eventUnderBar.leadingAnchor.constraint(equalTo: self.eventButton.leadingAnchor, constant: 8),
            self.eventUnderBar.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            self.eventUnderBar.widthAnchor.constraint(equalToConstant: 50),
            self.eventUnderBar.heightAnchor.constraint(equalToConstant: 5)
        ])
        
    }
    
    // Notice Button UnderBar
    func layoutNoticeUnderBar() {
        self.noticeUnderBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.noticeUnderBar.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            self.noticeUnderBar.leadingAnchor.constraint(equalTo: self.noticeButton.leadingAnchor, constant: 10),
            self.noticeUnderBar.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            self.noticeUnderBar.widthAnchor.constraint(equalToConstant: 65),
            self.noticeUnderBar.heightAnchor.constraint(equalToConstant: 5)
        ])
        
    }
    
    // Ranking Button UnderBar
    func layoutRankingUnderBar() {
        self.rankingUnderBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.rankingUnderBar.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            self.rankingUnderBar.leadingAnchor.constraint(equalTo: self.rankingEventButton.leadingAnchor, constant: 10),
            self.rankingUnderBar.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            self.rankingUnderBar.widthAnchor.constraint(equalToConstant: 85),
            self.rankingUnderBar.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    // Bottom Line
    func layoutBottomLine() {
        self.bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.bottomLine.backgroundColor = .systemGray
        
        NSLayoutConstraint.activate([
            self.bottomLine.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.bottomLine.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.bottomLine.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomLine.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.bottomLine.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.01)
        ])
    }
}
