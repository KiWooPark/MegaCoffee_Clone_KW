//
//  MoreEventAndNoticeDetailVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/30.
//


import Foundation
import UIKit

class MoreEventAndNoticeDetailVC: UIViewController {
    
    
    // MARK: [변수 선언] [0] : Frame
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    
    
    // MARK: [변수 선언] [1]: Main
    lazy var titleLabel: UILabel = {
       let title = UILabel()
        
        title.textColor = .label
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.numberOfLines = 0
        
        return title
    }()
    
    lazy var dateLabel: UILabel = {
       let date = UILabel()
        
        date.textColor = .label
        date.font = .systemFont(ofSize: 15, weight: .light)
        
        return date
    }()
    
    lazy var imgView: UIImageView = {
       let imgView = UIImageView()
        
        imgView.backgroundColor = .systemGray2
        
        return imgView
        
    }()
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
 
    
// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [Layout]
extension MoreEventAndNoticeDetailVC {
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutScrollView()
        layoutContentView()
        
        layoutTitleLabel()
        layoutDateLabel()
        layoutImgView()
    }
    
    
    // NaviCustom
    private func naviCustom() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        
        self.navigationItem.largeTitleDisplayMode = .never
        
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
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            // Dynamic Height
            self.contentView.heightAnchor.constraint(equalToConstant: 1100)
        ])
    }
    
    
    
    
    
    // TitleLabel
    private func layoutTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    // DateLabel
    private func layoutDateLabel() {
        self.contentView.addSubview(self.dateLabel)
        
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.dateLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.dateLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    // ImageView
    private func layoutImgView() {
        self.contentView.addSubview(self.imgView)
        
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imgView.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 10),
            self.imgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imgView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
    }
}

