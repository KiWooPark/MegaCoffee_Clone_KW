//
//  NickNameChangeViewController.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import Foundation
import UIKit


class MoreNickNameChangeAndLogoutVC: UIViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    let vc = MoreMemberInfoManagementViewController()


    
    
    // MARK: [변수 선언] [0]: Frame
    lazy var backViewButton: UIButton = {
       let back = UIButton()
        
        back.backgroundColor = .black
        back.alpha = 0.5
        
        back.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        return back
    }()
    
    
    
    // MARK: [LogOut] [0]: BackView
    lazy var logoutCenterView: UIView = {
      let center = UIView()
        
        center.backgroundColor = .white
        center.alpha = 1
        center.layer.cornerRadius = 7
    
        return center
    }()
    
    
    
    // MARK: [Logout] [1]: StackView
    lazy var logoutStackView: UIStackView = {
       let stackView = UIStackView()
        
      
        stackView.addArrangedSubview(self.logoutTitleLabel)
        stackView.addArrangedSubview(self.logoutInfoLabel)
        stackView.addArrangedSubview(self.logoutBottomStackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 7
        stackView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stackView.layer.masksToBounds = true
        
        return stackView
    }()
    
    
    
    private lazy var logoutTitleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        
        title.text = "로그아웃"
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        
        return title
    }()
    
    
    
    private lazy var logoutInfoLabel: UILabel = {
       let logoutInfo = UILabel()
        
        logoutInfo.text = "로그아웃 하시겠습니까?"
        logoutInfo.textAlignment = .center
        
        return logoutInfo
    }()
    
    
    
    
    // MARK: [LogOut] [2]: Bottom
    lazy var logoutBottomStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(self.logoutCancel)
        stackView.addArrangedSubview(self.logoutConfirm)
        
        stackView.distribution = .fillEqually

        return stackView
    }()

    
    

    lazy var logoutCancel: UIButton = {
       let cancel = UIButton()
        
        cancel.setTitle("취소", for: .normal)
        cancel.setTitleColor(customBrownColor, for: .normal)
        cancel.backgroundColor = .systemGray6
        
        cancel.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        return cancel
    }()
 
    
    
    lazy var logoutConfirm: UIButton = {
       let confirm = UIButton()
        
        confirm.setTitle("로그아웃", for: .normal)
        confirm.setTitleColor(.white, for: .normal)
        confirm.backgroundColor = customBrownColor
        
        confirm.addTarget(self, action: #selector(logoutTapped(sender:)), for: .touchUpInside)
        
        return confirm
    }()
    
    
    
    
    
    
    // MARK: [NickName] [0]: BackView
    lazy var nicknameCenterView: UIView = {
      let center = UIView()
        
        center.backgroundColor = .white
        center.alpha = 1
        center.layer.cornerRadius = 7
    
        return center
    }()
    
    
    
    
    // MARK: [NickName] [1]: StackView
    lazy var nicknameStackView: UIStackView = {
       let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(self.nicknameTitleLabel)
        stackView.addArrangedSubview(self.textFieldBackView)
        stackView.addArrangedSubview(self.nicknameBottomStackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20

        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 7
        stackView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stackView.layer.masksToBounds = true
        
        
        return stackView
    }()
    
    
    
    // MARK: [NickName] [1]-1 Center
    lazy var nicknameTitleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        
        title.text = "닉네임 변경"
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        
        return title
    }()
    
    
    lazy var textFieldBackView = UIView()
    lazy var textFieldView: UIView = {
       let view = UIView()
        
        self.textField.delegate = self
        
        view.backgroundColor = .white
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 7
        
        return view
        
    }()

    lazy var textField: UITextField = {
       let textfield = UITextField()
        
        
        textfield.font = .systemFont(ofSize: 18)
        textfield.placeholder = ""
        
        
        return textfield
    }()
    
    lazy var textFieldLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0/20"
        label.textColor = .systemGray
        
        return label
    }()
    
    
    
    // MARK: [NickName] [2]: Bottom
    lazy var nicknameBottomStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(self.nicknameCancel)
        stackView.addArrangedSubview(self.changeButton)
        
        stackView.distribution = .fillEqually
    
        return stackView
    }()

    
    

    lazy var nicknameCancel: UIButton = {
       let cancel = UIButton()
        
        
        cancel.setTitle("취소", for: .normal)
        cancel.setTitleColor(customBrownColor, for: .normal)
        cancel.backgroundColor = .systemGray6
        
        cancel.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        
        return cancel
    }()
    
    
    lazy var changeButton: UIButton = {
       let confirm = UIButton()
        
        
        confirm.setTitle("변경", for: .normal)
        confirm.setTitleColor(.white, for: .normal)
        confirm.backgroundColor = customBrownColor
        
        confirm.addTarget(self, action: #selector(changeTapped(sender:)), for: .touchUpInside)
        
        
        return confirm
    }()
    
    
    
    
    
    
    
    

    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        layout()
    }
    
    
    
    
    
    
    // MARK: [Keyboard]
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 4
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    

    
    
    
    // MARK: [Action]
    @objc func cancelTapped(sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    @objc func logoutTapped(sender: UIButton) {
        print("logout 완료")
        self.dismiss(animated: false)
    }
    
    
    @objc func changeTapped(sender: UIButton) {
        print("변경 완료")
        self.dismiss(animated: false)

    }
    
    
    
    
    
    
    
    
    // MARK: [Func] - Move
    func nickName() {
        logoutStackView.isHidden = true
        logoutCenterView.isHidden = true
        
    }
    
    
    func logout() {
        nicknameStackView.isHidden = true
        nicknameCenterView.isHidden = true
    }

    
    
    
    

// MARK: [Class End]
        
}

// MARK: [Class End]








// MARK: [TextField - Delegate]
extension MoreNickNameChangeAndLogoutVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 글자수 제한, counting
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        textFieldLabel.text = "\(updatedText.count)/20"
        textFieldLabel.textColor = .systemGray
        
        return updatedText.count <= 19
        
    }
}







// MARK: [Layout]
extension MoreNickNameChangeAndLogoutVC {
    
    private func layout() {
        layoutBackViewButton()
        
        // Logout
        layoutLogOutCenterView()
        layoutLogoutStackView()
        
        // NickName
        layoutNickNameCenterView()
        layoutNickNameStackView()
        layoutTextFieldView()
        layoutTextFieldAndLabel()
        
    }
    
    
    
    // BackView
    private func layoutBackViewButton() {
        self.view.addSubview(self.backViewButton)
        
        self.backViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backViewButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.backViewButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.backViewButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.backViewButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    
    
    // [Logout] CenterView
    private func layoutLogOutCenterView() {
        self.view.addSubview(self.logoutCenterView)
        
        self.logoutCenterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.logoutCenterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoutCenterView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.logoutCenterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.logoutCenterView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    
    // [Logout] StackView
    private func layoutLogoutStackView() {
        self.logoutCenterView.addSubview(self.logoutStackView)
        
        self.logoutStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.logoutStackView.topAnchor.constraint(equalTo: self.logoutCenterView.topAnchor, constant: 30),
            self.logoutStackView.leadingAnchor.constraint(equalTo: self.logoutCenterView.leadingAnchor),
            self.logoutStackView.trailingAnchor.constraint(equalTo: self.logoutCenterView.trailingAnchor),
            self.logoutStackView.bottomAnchor.constraint(equalTo: self.logoutCenterView.bottomAnchor)
            
        ])
        
       
    }
    
    
    
    // [NickName] CenterView
    private func layoutNickNameCenterView() {
        self.view.addSubview(self.nicknameCenterView)
        
        self.nicknameCenterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameCenterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nicknameCenterView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.nicknameCenterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.nicknameCenterView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25)
        ])
    }
    
    
    
    
    
    
    // [NickName] StackView
    private func layoutNickNameStackView() {
        self.nicknameCenterView.addSubview(self.nicknameStackView)
        
        self.nicknameStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.nicknameStackView.topAnchor.constraint(equalTo: self.nicknameCenterView.topAnchor, constant: 30),
            self.nicknameStackView.leadingAnchor.constraint(equalTo: self.nicknameCenterView.leadingAnchor),
            self.nicknameStackView.trailingAnchor.constraint(equalTo: self.nicknameCenterView.trailingAnchor),
            self.nicknameStackView.bottomAnchor.constraint(equalTo: self.nicknameCenterView.bottomAnchor)
        ])
        
        self.nicknameBottomStackView.heightAnchor.constraint(equalTo: self.nicknameCenterView.heightAnchor, multiplier: 0.23).isActive = true
        
    }
    
    
    // [NickName] TextField View
    private func layoutTextFieldView() {
        self.textFieldBackView.addSubview(self.textFieldView)
        
        self.textFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textFieldView.topAnchor.constraint(equalTo: self.textFieldBackView.topAnchor),
            self.textFieldView.leadingAnchor.constraint(equalTo: textFieldBackView.leadingAnchor, constant: 20),
            self.textFieldView.trailingAnchor.constraint(equalTo: textFieldBackView.trailingAnchor, constant: -20),
            self.textFieldView.bottomAnchor.constraint(equalTo: self.textFieldBackView.bottomAnchor)
        ])
    }
    
    
    
    // [NickName] TextField And Label
    private func layoutTextFieldAndLabel() {
        self.textFieldView.addSubview(self.textField)
        self.textFieldView.addSubview(self.textFieldLabel)
        
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            self.textField.topAnchor.constraint(equalTo: self.textFieldView.topAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.textFieldView.leadingAnchor, constant: 15),
            self.textField.bottomAnchor.constraint(equalTo: self.textFieldView.bottomAnchor),
            self.textField.widthAnchor.constraint(equalTo: self.textFieldView.widthAnchor, multiplier: 0.8),
            
            self.textFieldLabel.topAnchor.constraint(equalTo: self.textFieldView.topAnchor),
            self.textFieldLabel.trailingAnchor.constraint(equalTo: self.textFieldView.trailingAnchor, constant: -5),
            self.textFieldLabel.bottomAnchor.constraint(equalTo: self.textFieldView.bottomAnchor)
        ])
    }
 
    
}
