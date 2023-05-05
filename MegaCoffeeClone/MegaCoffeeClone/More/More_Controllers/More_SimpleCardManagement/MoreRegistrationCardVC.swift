//
//  MoreRegistrationCardVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit


// MARK: [Enum]
enum cardList {
    case cardName([CardModel])
    case cardNumber([CardModel])
    case cardExpirationPeriod([CardModel])
    case cardPassword([CardModel])
    case cardDivision([CardModel])
}




class MoreRegistrationCardVC: UIViewController {
    var dataSource = [cardList]()
    var keyHeight: CGFloat = 0.0
   
    
    
    // MARK: [변수 선언]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        
        tableView.register(MoreCardNameTVC.self, forCellReuseIdentifier: MoreCardNameTVC.identifier)
        tableView.register(MoreCardNumberTVC.self, forCellReuseIdentifier: MoreCardNumberTVC.identifier)
        tableView.register(MoreCardExpirationPeriodTVC.self, forCellReuseIdentifier: MoreCardExpirationPeriodTVC.identifier)
        tableView.register(MoreCardPWTVC.self, forCellReuseIdentifier: MoreCardPWTVC.identifier)
        tableView.register(MoreCardDivisionTVC.self, forCellReuseIdentifier: MoreCardDivisionTVC.identifier)
    
        
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.sectionFooterHeight = 0
        
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        return tableView
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        sectionCell()
        
        layout()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    
    
    // MARK: [Keyboard] -> 미완성
    @objc func keyboardWillShow(_ sender: NSNotification) {
        let userInfo:NSDictionary = sender.userInfo! as NSDictionary
                let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height + 40
        
                keyHeight = keyboardHeight

                self.view.frame.size.height -= keyboardHeight
    }
    
    @objc func keyboardWillHide(_ sender: NSNotification) {
        self.view.frame.size.height += keyHeight
    }
    
    
    
    
    
    
    
    
    
    // MARK: [Func]
    private func sectionCell() {
        let cardNa = CardModel()
        let sectionCardNa = cardList.cardName([cardNa])
        
        let cardNum = CardModel()
        let sectionCardNum = cardList.cardNumber([cardNum])
        
        let cardExp = CardModel()
        let sectionCardExp = cardList.cardExpirationPeriod([cardExp])
        
        let cardPW = CardModel()
        let sectionCardPW = cardList.cardPassword([cardPW])
        
        let cardDiv = CardModel()
        let sectionCardDiv = cardList.cardDivision([cardDiv])
        
        
        self.dataSource = [
            sectionCardNa, sectionCardNum, sectionCardExp, sectionCardPW, sectionCardDiv
        ]
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    
    
    
    
    


}



// MARK: [TableView - DataSource]
extension MoreRegistrationCardVC: UITableViewDataSource {
    
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch self.dataSource[indexPath.section] {
        
        case .cardName: return 130
        case .cardNumber: return 130
        case .cardExpirationPeriod: return 130
        case .cardPassword: return 130
        case .cardDivision: return 250
        
        
        }
      
    }
    
    // number of [section]
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    
    
    // number of [row section]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.dataSource[section] {
            
        case let .cardName(cardNames):
            return cardNames.count
        case let .cardNumber(cardNumbers):
            return cardNumbers.count
        case let .cardExpirationPeriod(cardExpirationPeriods):
            return cardExpirationPeriods.count
        case let .cardPassword(cardPasswords):
            return cardPasswords.count
        case let .cardDivision(cardDivisions):
            return cardDivisions.count
            
        }
        
        
    }
  

    // header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    // header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
 
    // header background
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
     
     
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch self.dataSource[indexPath.section] {
       
            
        // (1) Card Name
        case .cardName:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardNameTVC.identifier, for: indexPath) as! MoreCardNameTVC
           
            
            cell.titleLabel.text = "카드 이름"
            cell.countLabel.text = "0/20"
            cell.bottomLabel.text = "카드이름은 간편카드 페이지에서 변경하실 수 있습니다"
            
            return cell
            
            
            
            
        // (2) Card Number
        case .cardNumber:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardNumberTVC.identifier, for: indexPath) as! MoreCardNumberTVC
            
            
            cell.titleLabel.text = "카드 번호"
            
            return cell
            
            
        // (3) Card Expiration Period
        case .cardExpirationPeriod:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardExpirationPeriodTVC.identifier, for: indexPath) as! MoreCardExpirationPeriodTVC
         
            
            cell.titleLabel.text = "카드 유효기간"
            cell.centerNonButton.setTitle("/", for: .normal)
            
            return cell
            
            
            
        // (4) Card PassWord
        case .cardPassword:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardPWTVC.identifier, for: indexPath) as! MoreCardPWTVC
            
            
            cell.titleLabel.text = "카드 비밀번호 (앞 2자리)"
            cell.starLabel1.text = "*"
            cell.starLabel2.text = "*"
            
            return cell
            
            
            
        // (5) Card Division
        case .cardDivision:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardDivisionTVC.identifier, for: indexPath) as! MoreCardDivisionTVC
            
           
            
            cell.titleLabel.text = "고객 구분"
            
            cell.personalCardButton1.setTitle("개인카드", for: .normal)
            cell.personalCardButton2.setTitle("개인카드", for: .normal)
            cell.corporationCardButton1.setTitle("법인카드", for: .normal)
            cell.corporationCardButton2.setTitle("법인카드", for: .normal)

            cell.registrationButton.setTitle("결제비밀번호 등록", for: .normal)
            cell.rejectRegistrationButton.setTitle("결제비밀번호 등록", for: .normal)
            
            
            return cell

        }
        
    }
}





// MARK: [TableView - Delegate]
extension MoreRegistrationCardVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch self.dataSource[indexPath.section] {
        
        case .cardName: print("")
        case .cardNumber: print("")
        case .cardExpirationPeriod: print("")
        case .cardPassword: print("")
        case .cardDivision: print("")
        
        }
                
    }
     
}





// MARK: [Layout]
extension MoreRegistrationCardVC {
    
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutTableView()
    }
    
    
    
    // Navi Custom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "간편카드 등록"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
       
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}



