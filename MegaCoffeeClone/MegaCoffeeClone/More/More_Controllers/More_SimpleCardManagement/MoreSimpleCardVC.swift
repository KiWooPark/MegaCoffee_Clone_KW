//
//  MoreSimpleCardVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//


import Foundation
import UIKit

class MoreSimpleCardVC: UIViewController {
    
    // MARK: [변수 선언]
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()

    
    private lazy var contentView = UIView()
    
    
    private lazy var regisButton: UIButton = {
        let regis = UIButton(type: .system)
        let img = UIImage(systemName: "plus.circle")?.withTintColor(UIColor.gray, renderingMode: .alwaysOriginal)
        
        regis.setTitle("  카드 등록하기", for: .normal)
        regis.setTitleColor(UIColor.black, for: .normal)
        regis.titleLabel?.font = .systemFont(ofSize: 15)
        
        regis.setImage(img, for: .normal)
        regis.imageView?.contentMode = .scaleAspectFit
        regis.semanticContentAttribute = .forceLeftToRight
        
        regis.layer.borderWidth = 1
        regis.layer.borderColor = UIColor.gray.cgColor
        regis.layer.cornerRadius = 7
        
        regis.addTarget(self, action: #selector(regisButtonTapped), for: .touchUpInside)
        
        return regis
    }()
    
    
    private lazy var label: UILabel = {
       let label = UILabel()
        
        
        label.text = "등록된 간편카드가 없습니다."
        
        
        return label
    }()
    
    
    // MARK: [변수 선언]: Navi Item
    private lazy var settingButton: UIBarButtonItem = {
        let setting = UIBarButtonItem(image: UIImage(systemName:"gearshape"), style: .done, target: self, action: #selector(uiBarButtonTapped(_:)))
        
        
        return setting
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    
    
    
    
    
    
    
    // MARK: [Action]
    @objc func regisButtonTapped() {
        
        let regisButton = MoreRegistrationCardVC()
        self.navigationController?.pushViewController(regisButton, animated: false)
        
    }
    
    
    @objc private func uiBarButtonTapped(_ sender: UIBarButtonItem) {
        
        alertOK(message: "카드 등록 후 이용해주세요.")
        
    }
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [Layout]
extension MoreSimpleCardVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        
        naviCustom()
        
        layoutScrollView()
        layoutContentView()
        layoutRegisButton()
        
        layoutLabel()
    }
    
    
    // Navi Custom
    func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "간편카드"
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationItem.rightBarButtonItem = settingButton
    }

    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    // ContentView
    private func layoutContentView() {
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }
    
    
    // Regis Button
    private func layoutRegisButton() {
        self.contentView.addSubview(self.regisButton)
        
        self.regisButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.regisButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.regisButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.regisButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.regisButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    
    
    // Not Label
    private func layoutLabel() {
        self.contentView.addSubview(self.label)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.regisButton.bottomAnchor, constant: 200),
            self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)

        ])
    }
    
    
}


