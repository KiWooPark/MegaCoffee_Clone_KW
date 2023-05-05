//
//  HistoryInquiriyViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/31.
//

import UIKit

class MoreHistoryInquiriyViewController: MoreInquiryBaseViewController {


    
    private lazy var notImage: UIImageView = {
        let image = UIImageView()
        
        let noneImage = UIImage(named: "none!")
        image.image = noneImage
        image.sizeToFit()
       
        
        return image
    }()
    
   
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        layout()
    }
    
   
   
    
    
    override func layoutThickLineView() {
        self.topView.addSubview(self.thickLineView)
    
        
        self.thickLineView.backgroundColor = .black
        self.thickLineView.layer.cornerRadius = 3
        
        self.thickLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.thickLineView.topAnchor.constraint(equalTo: self.historyInquiriesButton.bottomAnchor),
            self.thickLineView.leadingAnchor.constraint(equalTo: self.historyInquiriesButton.leadingAnchor),
            
            self.thickLineView.widthAnchor.constraint(equalTo: self.historyInquiriesButton.widthAnchor),
            self.thickLineView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
    }
    
    
    @objc override func contactUsButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
 

    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
                    
}

// MARK: [Class End]












// MARK: [Layout]
extension MoreHistoryInquiriyViewController {
    
    
    private func layout() {
        layouthistoryInquiriesButton()
        layoutNoneImage()
    }
    
    
    
    private func layouthistoryInquiriesButton() {
        contactUsButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        historyInquiriesButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
    }
    
    
    
    
    private func layoutNoneImage() {
        self.view.addSubview(notImage)
        
        self.notImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.notImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            //self.notImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.notImage.topAnchor.constraint(equalTo: self.bottomLineView.bottomAnchor, constant: 150),
            self.notImage.widthAnchor.constraint(equalToConstant: 230),
            self.notImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    
}
