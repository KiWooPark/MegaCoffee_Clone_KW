//
//  MoreCardCustomerTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  고객 구분

import Foundation
import UIKit


class MoreCardDivisionTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    let cardNameTVC = MoreCardNameTVC()
    let cardNumTVC = MoreCardNumberTVC()
    let cardEXPeriodTVC = MoreCardExpirationPeriodTVC()
    let cardPWTVC = MoreCardPWTVC()
    
    
    
    
    // MARK: Image
    // (1) none
    let circleImg = UIImage(systemName: "circle")?.withTintColor(UIColor.gray, renderingMode: .alwaysOriginal)
    // (2) fill
    let circleFillImg = UIImage(systemName: "circle.inset.filled")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
    
    

    // MARK: [변수 선언] [0]: Top
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
   
    
    
    
    
    
    
    
    // MARK: [변수 선언] [1]: 개인카드(default)
    lazy var stackViewPersonalFill: UIStackView = {
        let pFill = UIStackView()
        
        pFill.spacing = 6
        
        return pFill
    }()
    
    lazy var personalCardCircleFill: UIButton = {
        let fill = UIButton(type: .system)
        
        fill.setImage(circleFillImg, for: .normal)
        
        fill.addTarget(self, action: #selector(personalButton), for: .touchUpInside)
        
        return fill
    }()
    
    lazy var personalCardButton1: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(personalButton), for: .touchUpInside)
        
        return button
    }()
    
    
    //
    lazy var stackViewCorporationNone: UIStackView = {
       let cNone = UIStackView()
        
        cNone.spacing = 6
        
        return cNone
    }()
    
    
    lazy var corporationCardCircle: UIButton = {
        let circle = UIButton(type: .system)
        
        circle.setImage(circleImg, for: .normal)
        circle.addTarget(self, action: #selector(corporationButton), for: .touchUpInside)
        
        return circle
    }()
    
   
    lazy var corporationCardButton1: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(corporationButton), for: .touchUpInside)
        
        return button
    }()
    
    
  
    
    
    
    
    
    // MARK: [변수 선언] [2]: 법인카드
    lazy var stackViewPersonalNone: UIStackView = {
        let pNone = UIStackView()
        
        pNone.spacing = 6
        
        return pNone
    }()
    
    lazy var personalCardCircle: UIButton = {
        let circle = UIButton(type: .system)
        
        circle.setImage(circleImg, for: .normal)
        circle.addTarget(self, action: #selector(personalButton), for: .touchUpInside)
        
        return circle
    }()
    
    lazy var personalCardButton2: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(personalButton), for: .touchUpInside)
        
        return button
    }()
    
    
    //
    lazy var stackViewCorporationFill: UIStackView = {
       let cFill = UIStackView()
        
        cFill.spacing = 6
        
        return cFill
    }()
    
    
    lazy var corporationCardCircleFill: UIButton = {
        let fill = UIButton(type: .system)
        
        fill.setImage(circleFillImg, for: .normal)
        fill.addTarget(self, action: #selector(corporationButton), for: .touchUpInside)
        
        return fill
    }()
    
   
    lazy var corporationCardButton2: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(corporationButton), for: .touchUpInside)
        
        return button
    }()
    

    
    
    
    
    
    
    
    
    
    // MARK: [변수 선언] [3]: Bottom
        
    
    lazy var textField: UITextField = {
        let text = UITextField()
        
        
        text.placeholder = "생년월일 6자리 (YYMMDD)"

        text.addLeftPadding()
        
        
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 6
        
        text.keyboardType = .numberPad
        text.addDoneButtonOnKeyboard()
        
        return text
    }()
    
    
    
    lazy var rejectRegistrationButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .systemGray4
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(activeButtonTapped(_:)), for: .touchUpInside)

    
        return button
    }()
    
    
    
    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .red
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(activeButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        textField.delegate = self
        
        stackViewPersonalNone.isHidden = true
        stackViewCorporationFill.isHidden = true
        registrationButton.isHidden = true
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    // MARK: [Action]
    
    @objc func personalButton() {
        stackViewPersonalNone.isHidden = true
        stackViewCorporationFill.isHidden = true
        
        stackViewPersonalFill.isHidden = false
        stackViewCorporationNone.isHidden = false
        
        textField.placeholder = "생년월일 6자리 (YYMMDD)"
        textField.text = ""
    }
    
    @objc func corporationButton() {
        stackViewPersonalNone.isHidden = false
        stackViewCorporationFill.isHidden = false
        
        stackViewPersonalFill.isHidden = true
        stackViewCorporationNone.isHidden = true
        
        textField.placeholder = "사업자번호10자리"
        textField.text = ""
    }
    
    
    
    
    // MARK: [미완성]
    @objc func activeButtonTapped(_ sender: UIButton) {
        
        if (cardNameTVC.textField.text != "")
        {
            rejectRegistrationButton.backgroundColor = .blue
            print("1")
        } else {
            rejectRegistrationButton.backgroundColor = .orange
            print("2")
        }
        
    }
    
    
    
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.titleLabel)
        
        //
        self.contentView.addSubview(self.stackViewPersonalFill)
        self.stackViewPersonalFill.addArrangedSubview(self.personalCardCircleFill)
        self.stackViewPersonalFill.addArrangedSubview(self.personalCardButton1)
        self.contentView.addSubview(self.stackViewCorporationNone)
        self.stackViewCorporationNone.addArrangedSubview(self.corporationCardCircle)
        self.stackViewCorporationNone.addArrangedSubview(self.corporationCardButton1)
        

        self.contentView.addSubview(self.stackViewPersonalNone)
        self.stackViewPersonalNone.addArrangedSubview(self.personalCardCircle)
        self.stackViewPersonalNone.addArrangedSubview(self.personalCardButton2)
        self.contentView.addSubview(self.stackViewCorporationFill)
        self.stackViewCorporationFill.addArrangedSubview(self.corporationCardCircleFill)
        self.stackViewCorporationFill.addArrangedSubview(self.corporationCardButton2)
        
        //
        self.contentView.addSubview(self.textField)
        self.contentView.addSubview(self.rejectRegistrationButton)
        self.contentView.addSubview(self.registrationButton)
    }
    
    
    
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutTitleLabel()
        
        layoutStackViewPersonalFill()
        layoutStackViewCorporationFill()
        
        layoutTextField()
        
        layoutdefaultButton()
        layoutTotalActivateButton()
    }
    
    
    
    
    
    func layoutTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func layoutStackViewPersonalFill() {
        self.stackViewPersonalFill.translatesAutoresizingMaskIntoConstraints = false
        self.stackViewCorporationNone.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackViewPersonalFill.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackViewPersonalFill.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackViewPersonalFill.heightAnchor.constraint(equalToConstant: 40),
            
            self.stackViewCorporationNone.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackViewCorporationNone.leadingAnchor.constraint(equalTo: self.stackViewPersonalFill.trailingAnchor, constant: 20),
            self.stackViewCorporationNone.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func layoutStackViewCorporationFill() {
            self.stackViewPersonalNone.translatesAutoresizingMaskIntoConstraints = false
            self.stackViewCorporationFill.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackViewPersonalNone.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackViewPersonalNone.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackViewPersonalNone.heightAnchor.constraint(equalToConstant: 40),
            
            self.stackViewCorporationFill.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackViewCorporationFill.leadingAnchor.constraint(equalTo: self.stackViewPersonalFill.trailingAnchor, constant: 20),
            self.stackViewCorporationFill.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    func layoutTextField() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.stackViewPersonalFill.bottomAnchor, constant: 10),
            self.textField.topAnchor.constraint(equalTo: self.stackViewPersonalNone.bottomAnchor, constant: 10),
            
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.textField.heightAnchor.constraint(equalToConstant: 50)
        ])
            
    }
    
    
    func layoutdefaultButton() {
        self.rejectRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.rejectRegistrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.rejectRegistrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.rejectRegistrationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.rejectRegistrationButton.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
    
    func layoutTotalActivateButton() {
        self.registrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.registrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.registrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.registrationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.registrationButton.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
            
            
    
    
    
    
}




// MARK: [TextField - Delegate]
extension MoreCardDivisionTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        
        
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        // Personal Card
        if (stackViewPersonalNone.isHidden == true) {
            
            return updatedText.count <= 6
            
        // Corpertaion Card
        } else {
            
            return updatedText.count <= 10
            
        }
        
        
       
        

        
        
    }
}






// Helper
// https://developer-fury.tistory.com/46
extension UITextField {
    
    // 좌측 공간(padding) 만들기
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
      }
    
}
