//
//  MoreCardNumberTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  카드 번호

import Foundation
import UIKit


class MoreCardNumberTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }

    
    
    // MARK: [변수 선언]
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    lazy var textField1: UITextField = {
        let text1 = UITextField()
        
        text1.tag = 1
        text1.layer.borderWidth = 1
        text1.layer.borderColor = UIColor.gray.cgColor
        text1.layer.cornerRadius = 6
        
        text1.textAlignment = .center
        
        text1.keyboardType = .numberPad
        text1.addDoneButtonOnKeyboard()
        
        text1.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text1
    }()
    lazy var textField2: UITextField = {
        let text2 = UITextField()
        
        text2.tag = 2
        text2.layer.borderWidth = 1
        text2.layer.borderColor = UIColor.gray.cgColor
        text2.layer.cornerRadius = 6
        
        text2.textAlignment = .center
        
        text2.keyboardType = .numberPad
        text2.addDoneButtonOnKeyboard()
        
        text2.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text2
    }()
    lazy var textField3: UITextField = {
        let text3 = UITextField()
        
        text3.tag = 3
        text3.layer.borderWidth = 1
        text3.layer.borderColor = UIColor.gray.cgColor
        text3.layer.cornerRadius = 6
        
        text3.textAlignment = .center
        
        text3.keyboardType = .numberPad
        text3.addDoneButtonOnKeyboard()
        
        text3.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text3
    }()
    lazy var textField4: UITextField = {
        let text4 = UITextField()
        
        text4.tag = 4
        text4.layer.borderWidth = 1
        text4.layer.borderColor = UIColor.gray.cgColor
        text4.layer.cornerRadius = 6
        
        text4.textAlignment = .center
        
        text4.keyboardType = .numberPad
        text4.addDoneButtonOnKeyboard()
        
        text4.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text4
    }()
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
        
        self.textField2.isSecureTextEntry = true
        self.textField3.isSecureTextEntry = true
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
        
        
      }
    
    
    // MARK: [Action]
    @objc func textFieldNextFocus(_ sender: UITextField) {
       
        switch sender.tag {
        case 1:
            if textField1.text?.count == 4 {
                textField2.becomeFirstResponder()
            }
        case 2:
            if textField2.text?.count == 4 {
                textField3.becomeFirstResponder()
            }
        case 3:
            if textField3.text?.count == 4 {
                textField4.becomeFirstResponder()
            }
        case 4:
            if textField4.text?.count == 4 {
                textField4.resignFirstResponder()
            }
        default:
            break
        }
        
        
    }
    
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(textField1)
        self.stackView.addArrangedSubview(textField2)
        self.stackView.addArrangedSubview(textField3)
        self.stackView.addArrangedSubview(textField4)
    }
    
    
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutTitleLabel()
        layoutStackView()
    
    }
    
    // TitleLabel
    func layoutTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])
    }
    
    
    // StackView
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            
            
        ])
    }
    
    
}




// MARK: [TextField - Delegate]
extension MoreCardNumberTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 글자수 제한, counting
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 4
    }
    
}





