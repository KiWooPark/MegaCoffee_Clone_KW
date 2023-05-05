//
//  ContentInitializationViewController.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/07.
//

import Foundation
import UIKit



// MARK: [ (D) Protocol]
protocol choiceInquiryTypeData: AnyObject {
    func choiceStampData()
    func choiceCouponData()
    func choiceMegaCardRefundData()
    func choiceErrorData()
    func choiceUserInfoData()
}


class MoreChoiceInquiryTypeViewController: UIViewController {
    var delegate: choiceInquiryTypeData?
   
    
    // MARK: [변수 선언] [0]: Frame
    private lazy var backViewButton: UIButton = {
        let back = UIButton()
        
        back.addTarget(self, action: #selector(closeButton(sender:)), for: .touchUpInside)
        
        return back
    }()
    
    
    // MARK: [변수 선언] [1]: View Top
    private lazy var mainView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 7
        
        return view
    }()
    
    private lazy var mainTopView: UIView = {
       let top = UIView()
        
        top.addSubview(mainViewLabel)
        top.addSubview(mainViewButton)
        
        top.layer.cornerRadius = 7
        
        return top
    }()
    
    private lazy var mainViewLabel: UILabel = {
       let label = UILabel()
        
        label.text = "문의 유형"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    
    private lazy var mainViewButton: UIButton = {
       let button = UIButton()
        
        let img = UIImage(systemName: "xmark")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(xmarkButton(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    
    
    // MARK: [변수 선언] [2]: View List Button
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(stampButton)
        stackView.addArrangedSubview(couponButton)
        stackView.addArrangedSubview(megaCardRefundButton)
        stackView.addArrangedSubview(errorButton)
        stackView.addArrangedSubview(userInfoButton)
        
        stackView.axis = .vertical
        
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        
        
        
        return stackView
    }()
    
    private lazy var stampButton: UIButton = {
        let stamp = UIButton()
        
        stamp.setTitle("스탬프", for: .normal)
        stamp.setTitleColor(UIColor.black, for: .normal)
        
        
        stamp.addTarget(self, action: #selector(stampButtonTapped(sender:)), for: .touchUpInside)
        
        return stamp
    }()
    
    private lazy var couponButton: UIButton = {
        let coupon = UIButton()
        
        coupon.setTitle("쿠폰", for: .normal)
        coupon.setTitleColor(UIColor.black, for: .normal)
        
        coupon.addTarget(self, action: #selector(couponButtonTapped(sender:)), for: .touchUpInside)
        
        return coupon
    }()
    
    private lazy var megaCardRefundButton: UIButton = {
        let card = UIButton()
        
        card.setTitle("메가선불카드 환불", for: .normal)
        card.setTitleColor(UIColor.black, for: .normal)
        
        card.addTarget(self, action: #selector(megaCardRefundButtonTapped(sender:)), for: .touchUpInside)
        
        return card
    }()
    
    private lazy var errorButton: UIButton = {
        let error = UIButton()
        
        error.setTitle("오류", for: .normal)
        error.setTitleColor(UIColor.black, for: .normal)
        
        error.addTarget(self, action: #selector(errorButtonTapped(sender:)), for: .touchUpInside)
        
        return error
    }()
    
    private lazy var userInfoButton: UIButton = {
        let info = UIButton()
        
        info.setTitle("회원정보", for: .normal)
        info.setTitleColor(UIColor.black, for: .normal)
        
        info.addTarget(self, action: #selector(userInfoButtonTapped(sender:)), for: .touchUpInside)
        
        return info
    }()
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
  
    
    
    
    
    // MARK: [Action]
    
    @objc private func closeButton(sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    @objc private func xmarkButton(sender: UIButton) {
        dismiss(animated: false)
    }
    
    
    @objc private func stampButtonTapped(sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.choiceStampData()
    }
   
    
    @objc private func couponButtonTapped(sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.choiceCouponData()
        
    }
    
    @objc private func megaCardRefundButtonTapped(sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.choiceMegaCardRefundData()
        
    }
    
    @objc private func errorButtonTapped(sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.choiceErrorData()
    }
    
    @objc private func userInfoButtonTapped(sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.choiceUserInfoData()
    }
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]





// MARK: [Layout]
extension MoreChoiceInquiryTypeViewController {
    
    private func layout() {

        layoutBackView()
        //
        layoutMainView()
        layoutMainTopView()
        //
        layoutStackView()
        
    }
    
    // Back View
    private func layoutBackView() {
        self.view.addSubview(self.backViewButton)
        
        self.backViewButton.backgroundColor = .black
        self.backViewButton.alpha = 0.5
        
        self.backViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backViewButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backViewButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backViewButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backViewButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
     
     
    // Main View
    private func layoutMainView() {
        self.view.addSubview(self.mainView)
        
        self.mainView.backgroundColor = .white
        self.mainView.alpha = 1
        
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           
            self.mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    
    // Main View [Top]
    private func layoutMainTopView() {
        self.mainView.addSubview(self.mainTopView)
        
        self.mainTopView.backgroundColor = .white
        
        self.mainTopView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainTopView.topAnchor.constraint(equalTo: self.mainView.topAnchor),
            self.mainTopView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            self.mainTopView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            self.mainTopView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
        self.mainViewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainViewLabel.topAnchor.constraint(equalTo: self.mainTopView.topAnchor, constant: 20),
            self.mainViewLabel.leadingAnchor.constraint(equalTo: self.mainTopView.leadingAnchor, constant: 20)
            ])
        
        
        
        
        self.mainViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainViewButton.topAnchor.constraint(equalTo: self.mainTopView.topAnchor, constant: 20),
            self.mainViewButton.trailingAnchor.constraint(equalTo: self.mainTopView.trailingAnchor, constant: -20)
            ])
        
    }
    
    
    // StackView
    private func layoutStackView() {
        self.mainView.addSubview(self.stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.mainTopView.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        self.stampButton.titleLabel?.leadingAnchor.constraint(equalTo: self.stampButton.leadingAnchor, constant: 25).isActive = true
        self.couponButton.titleLabel?.leadingAnchor.constraint(equalTo: self.stampButton.leadingAnchor, constant: 25).isActive = true
        self.megaCardRefundButton.titleLabel?.leadingAnchor.constraint(equalTo: self.stampButton.leadingAnchor, constant: 25).isActive = true
        self.errorButton.titleLabel?.leadingAnchor.constraint(equalTo: self.stampButton.leadingAnchor, constant: 25).isActive = true
        self.userInfoButton.titleLabel?.leadingAnchor.constraint(equalTo: self.stampButton.leadingAnchor, constant: 25).isActive = true
    }
}
