//
//  GiftPaymentVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/26.
//

import UIKit
import ContactsUI

class GiftPaymentVC: UIViewController{
    

    @IBOutlet weak var paymentTableView: UITableView!
    
    struct Contact {
        let name: String
        let phoneNumber: String
    }
    
    var contactArray = [Contact]()
    
    var giftSelf = false
    
    let coreDataManager = CoreDataManager.shared
    
    var isTextOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        paymentTableView.register(UINib(nibName: "GiftContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
        
        paymentTableView.register(UINib(nibName: "GiftShoppingBasketTableViewCell", bundle: nil), forCellReuseIdentifier: "tableShoppingCell")
        
    
    }
    
    //연락처뷰를 띄어준다
    func presentContactPicker() {
        let contactPickerVC = CNContactPickerViewController()
        contactPickerVC.delegate = self
        contactPickerVC.displayedPropertyKeys = [CNContactGivenNameKey,
                                                 CNContactFamilyNameKey,
                                                 CNContactPhoneNumbersKey]
        present(contactPickerVC, animated: true)
    }
    
    
}

extension GiftPaymentVC: CNContactPickerDelegate{
    
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // You can fetch selected name and number in the following way
        
        // user name
        let userGivenName:String = contact.givenName
        let userFamilyName: String = contact.familyName
        
        // user phone number
        let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
        let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value
        
        
        // user phone number string
        let primaryPhoneNumberStr:String = firstPhoneNumber.stringValue
        
        let newContact = Contact(name: primaryPhoneNumberStr, phoneNumber: "\(userGivenName)\(userFamilyName)")
        
        contactArray.append(newContact)
        paymentTableView.reloadData()
        
        
    }
}

extension GiftPaymentVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    //MARK: - paymentTableView HeaderView 설정
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            //메시지 입력 섹션
            let headerView = UIView()
            let enterMessageLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 90, height: 35))
            headerView.addSubview(enterMessageLabel)
            enterMessageLabel.text = "메시지 입력"
            enterMessageLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            return headerView
            
        } else if section == 1 {
            //보내는 사람 섹션
            let headerView = UIView()
            let senderLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 90, height: 35))
            headerView.addSubview(senderLabel)
            senderLabel.text = "보내는 사람"
            senderLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            return headerView
            
        } else if section == 2 {
            //전송 수단 섹션
            let headerView = UIView()
            let sendMethodLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 90, height: 35))
            headerView.addSubview(sendMethodLabel)
            sendMethodLabel.text = "전송 수단"
            sendMethodLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            return headerView
            
        } else if section == 3 {
            //받는 사람 섹션
            let headerView = UIView()
            let recieverLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 90, height: 35))
            let contactButton = UIButton(frame: CGRect(x: 310, y: 10, width: 90, height: 35))
            headerView.addSubview(recieverLabel)
            headerView.addSubview(contactButton)
            
            //받는사람 레이블 설정
            recieverLabel.text = "받는 사람"
            recieverLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            //연락처 추가 버튼 설정
            contactButton.setTitle("연락처 추가", for: .normal)
            contactButton.setTitleColor(.black, for: .normal)
            contactButton.layer.borderColor = UIColor.systemGray3.cgColor
            contactButton.layer.cornerRadius = 18
            contactButton.layer.borderWidth = 0.5
            contactButton.contentHorizontalAlignment = .center
            contactButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            contactButton.addTarget(self, action: #selector(addContactButtonTapped), for: .touchUpInside)
            contactButton.tag = section
            if giftSelf == true {
                contactButton.isHidden = true
            } else {
                contactButton.isHidden = false
            }
            
            return headerView
        } else if section == 4 {
            //결제 수단 섹션
            let headerView = UIView()
            let paymentMethodLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 35))
            headerView.addSubview(paymentMethodLabel)
            //결제 수단 레이블 설정
            paymentMethodLabel.text = "결제수단"
            paymentMethodLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            return headerView
        } else {
            let headerView = UIView()
            
            return headerView
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0...4:
            return 50
        default:
            return 0
        }
    }
    
    
   
    //MARK: - paymentTableView Cell 설정
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return contactArray.count
        }else if section == 5 {
            return coreDataManager.itemArray.count
        }else if section == 6 {
            if isTextOpened == true {
                return 4
            }else {
                return 3
            }
        }else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sendMethodCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! GiftContactTableViewCell
            //초기에 contactArray(연락처배열)은 비어있기때문에 다음과 같이 처리한다.
            if contactArray.count != 0 {
                cell.nameLabel.text = contactArray[indexPath.row].phoneNumber
                cell.phoneNumberLabel.text = contactArray[indexPath.row].name
            }
            return cell
            
        } else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentMethodCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableShoppingCell", for: indexPath) as! GiftShoppingBasketTableViewCell
            cell.productImageview.image = UIImage()
            cell.nameLabel.text = coreDataManager.itemArray[indexPath.row].name!
            cell.priceLabel.text = "\(coreDataManager.itemArray[indexPath.row].total)원"
            cell.numberOfLabel.text = "\(coreDataManager.itemArray[indexPath.row].number)개"
            cell.plusView.isHidden = true
            cell.minusView.isHidden = true
            cell.cancelView.isHidden = true
//            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "totalPriceCell", for: indexPath) as! GiftTotalPriceTableViewCell
                return cell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! GiftNoteTableViewCell
                return cell
            }else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noteTextCell", for: indexPath)
                cell.backgroundColor = UIColor.yellow
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "payButtonCell", for: indexPath)
                cell.backgroundColor = UIColor.yellow
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 6 {
            if indexPath.row == 1 {
                isTextOpened.toggle()
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else if indexPath.section == 3 {
            return 50
        }else if indexPath.section == 4 {
            return 40
        }else if indexPath.section == 5 {
            return 100
        } else if indexPath.section == 6 {
            if indexPath.row == 0 {
                return 70
            }else if indexPath.row == 1 {
                return 60
            }else if indexPath.row == 2 {
                if isTextOpened == true {
                    return 400
                }else {
                    return 0
                }
            }else {
                return 60
            }
        } else { //섹션 1,2
            return 80
        }
    }
    
    //MARK: - paymentTableView FooterView 설정
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 3 {
            let footerView = UIView()
            let giftSelfButton = UIButton(frame: CGRect(x: 10, y: 20, width: 200, height: 35))
            let space = UIView(frame: CGRect(x: 0, y: 60, width: 1000, height: 7))
            footerView.addSubview(giftSelfButton)
            footerView.addSubview(space)
            space.backgroundColor = UIColor.systemGray6
            //나에게 선물하기 버튼
            giftSelfButton.setImage(UIImage(systemName: "circle"), for: .normal)
            giftSelfButton.tintColor = UIColor.black
            giftSelfButton.setTitle("나에게 선물하기", for: .normal)
            giftSelfButton.setTitleColor(.black, for: .normal)
            giftSelfButton.contentHorizontalAlignment = .leading
            giftSelfButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            giftSelfButton.addTarget(self, action: #selector(giftSelfButtonTapped), for: .touchUpInside)
            giftSelfButton.tag = section
            if giftSelf == true {
                giftSelfButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                giftSelfButton.setImage(UIImage(systemName: "circle"), for: .normal)
            }
            
            return footerView
        }else {
            let footerView = UIView()
            footerView.backgroundColor = UIColor.systemGray6
            return footerView
        }
    }
    
    
    //연락처 추가 버튼 클릭시
    @objc func addContactButtonTapped(_ sender: UIButton) {
        presentContactPicker()
    }
    
    //나에게 선물하기 버튼 클릭시
    @objc func giftSelfButtonTapped(_ sender: UIButton) {
        giftSelf.toggle()
        contactArray.removeAll()
        paymentTableView.reloadData()
        // contactButton과 giftSelfButton에 접근할수 없어 giftSelf만 toggle해준다.
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 3:
            return 50
        default:
            return 7
        }
    }
    
}
