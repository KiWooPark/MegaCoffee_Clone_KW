//
//  InquiryBaseViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/31.
//



import UIKit

class MoreInquiryBaseViewController: UIViewController {
    
    // MARK: [변수 선언] [0] : Frame
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    lazy var contentView = UIView()
    
    
    
    // MARK: [변수 선언] [1] : Button
    lazy var topView = UIView()
    
    lazy var contactUsButton: UIButton = {
        let contact = UIButton()
        
        contact.translatesAutoresizingMaskIntoConstraints = false
        contact.setTitle("문의하기", for: .normal)
        contact.setTitleColor(.black, for: .normal)
        contact.addTarget(self, action: #selector(contactUsButtonTapped(sender:)), for: .touchUpInside)
        
        return contact
    }()
    
    
    lazy var historyInquiriesButton: UIButton = {
        let history = UIButton()
        
        
        history.translatesAutoresizingMaskIntoConstraints = false
        history.setTitle("문의내역", for: .normal)
        history.setTitleColor(.black, for: .normal)
        history.addTarget(self, action: #selector(historyInquiriesButtonTapped(sender:)), for: .touchUpInside)
        
        return history
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
       
        stackView.addArrangedSubview(contactUsButton)
        stackView.addArrangedSubview(historyInquiriesButton)
        
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    lazy var thickLineView = UIView()
    lazy var bottomLineView = UIView()

    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    
    
    // MARK: [Action]
    @objc func contactUsButtonTapped(sender: UIButton) { }
    @objc func historyInquiriesButtonTapped(sender: UIButton) { }
    
    
    
    


// MARK: [Class End]
            
}

// MARK: [Class End]












// MARK: [Layout]
extension MoreInquiryBaseViewController {
    
    private func layout() {
        
        backFrame()
        layoutTotalTopView()
        
    }
    
    
    
    
    //
    private func backFrame() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        
        layoutScrollView()
        layoutContentView()
    }
    //
    private func layoutTotalTopView() {
        layoutTopView()
        layoutStackView()
        layoutThickLineView()
        layoutBottomLineView()
    }
    
    
    
    
    
    
    
    
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "앱 관련 문의"
        
        self.navigationItem.largeTitleDisplayMode = .never
    }

   
    
    
    
    
    
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
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
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 780)
        ])
    }
    
    // TopView
    private func layoutTopView() {
        self.contentView.addSubview(self.topView)
        
        self.topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.topView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.topView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.topView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    
    
    // StackView
    private func layoutStackView() {
        self.topView.addSubview(self.stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor, constant: 10)
        ])
    }
    
    
    
    // ThickLineView
    @objc func layoutThickLineView() { }
    
    
    
    // BottomLineView
    private func layoutBottomLineView() {
        self.contentView.addSubview(self.bottomLineView)
        
        self.bottomLineView.backgroundColor = .systemGray3

        self.bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomLineView.topAnchor.constraint(equalTo: self.topView.bottomAnchor),
            self.bottomLineView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.bottomLineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    
    
}
