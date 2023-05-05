//
//  MoreCardNameTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  카드 이름

import Foundation
import UIKit


class MoreCardNameTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    // MARK: [변수 선언]
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    lazy var textFieldBackView: UIView = {
        let back = UIView()
        
        back.layer.borderWidth = 1
        back.layer.borderColor = UIColor.gray.cgColor
        back.layer.cornerRadius = 6
        
        return back
    }()
    lazy var textField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "나의간편카드"
        text.isUserInteractionEnabled = true
        
        text.addDoneButtonOnKeyboard()
        
        return text
    }()
    lazy var countLabel = UILabel()
    
    lazy var bottomLabel: UILabel = {
        let bottom = UILabel()
        
        bottom.font = .systemFont(ofSize: 14)
        bottom.textColor = .systemGray3
        
        return bottom
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        return stackView
    }()
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        textField.delegate = self
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.textFieldBackView)
        self.stackView.addArrangedSubview(self.bottomLabel)
        
        self.textFieldBackView.addSubview(self.textField)
        self.textFieldBackView.addSubview(self.countLabel)
        
    }
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutStackView()
        layoutTextFieldBackView()

    }
    
    
    
    // Layout - TitleLabel
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
               self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
               self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
               
            ])
        
        self.titleLabel.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.4).isActive = true
        self.textFieldBackView.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.4).isActive = true
        self.bottomLabel.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.2).isActive = true
        
    }
    
    
    // Layout - TextField View
    func layoutTextFieldBackView() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.textFieldBackView.topAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.textFieldBackView.leadingAnchor, constant: 10),
            self.textField.bottomAnchor.constraint(equalTo: self.textFieldBackView.bottomAnchor),
            self.textField.widthAnchor.constraint(equalTo: self.textFieldBackView.widthAnchor, multiplier: 0.80),
            
            self.countLabel.topAnchor.constraint(equalTo: self.textFieldBackView.topAnchor),
            self.countLabel.trailingAnchor.constraint(equalTo: self.textFieldBackView.trailingAnchor),
            self.countLabel.bottomAnchor.constraint(equalTo: self.textFieldBackView.bottomAnchor),
            self.countLabel.widthAnchor.constraint(equalTo: self.textFieldBackView.widthAnchor, multiplier: 0.15)
        ])
        
        
    }
    
        


    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]



// MARK: [TextField - Delegate]
extension MoreCardNameTVC: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 글자수 제한, counting
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        countLabel.text = "\(range.location)/20"
        
        return updatedText.count <= 20
        
    }
    
    
}
