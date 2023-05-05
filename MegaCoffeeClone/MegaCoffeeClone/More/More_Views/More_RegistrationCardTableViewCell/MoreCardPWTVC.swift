//
//  MoreCardPWTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  카드 비밀번호 (앞 2자리)

import Foundation
import UIKit


class MoreCardPWTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    // MARK: [변수 선언]
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    lazy var textFieldFirst: UITextField = {
        let text1 = UITextField()
        
        text1.layer.borderWidth = 1
        text1.layer.borderColor = UIColor.gray.cgColor
        text1.layer.cornerRadius = 6
        
        text1.textAlignment = .center
        
        text1.keyboardType = .numberPad
        text1.addDoneButtonOnKeyboard()
        
        text1.tag = 1
        text1.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text1
    }()
    lazy var textFieldSecond: UITextField = {
        let text2 = UITextField()
        
        text2.layer.borderWidth = 1
        text2.layer.borderColor = UIColor.gray.cgColor
        text2.layer.cornerRadius = 6
        
        text2.textAlignment = .center
        
        text2.keyboardType = .numberPad
        text2.addDoneButtonOnKeyboard()
        
        text2.tag = 2
        text2.addTarget(self, action: #selector(textFieldNextFocus(_:)), for: .editingChanged)
        
        return text2
    }()
    
    lazy var starLabel1: UILabel = {
        let star1 = UILabel()
        
        star1.font = .systemFont(ofSize: 30)
        star1.textAlignment = .center
        
        return star1
    }()
    
    
    lazy var starLabel2: UILabel = {
        let star2 = UILabel()
        
        star2.font = .systemFont(ofSize: 30)
        star2.textAlignment = .center
        
        return star2
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        textFieldFirst.delegate = self
        textFieldSecond.delegate = self
        
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
            if textFieldFirst.text?.count == 1 {
                textFieldSecond.becomeFirstResponder()
            }
        case 2:
            if textFieldSecond.text?.count == 1 {
                textFieldSecond.resignFirstResponder()
            }
        default:
            break
        }
    
    }
    
    
    
    // MARK: [Add View]
    func addSubView() {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(textFieldFirst)
        self.stackView.addArrangedSubview(textFieldSecond)
        self.stackView.addArrangedSubview(starLabel1)
        self.stackView.addArrangedSubview(starLabel2)

        
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
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    
}


// MARK: [TextField - Delegate]
extension MoreCardPWTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 1
    }
}

