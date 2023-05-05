//
//  OrderpopViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/06.
//

import UIKit

// MARK: [Enum] ----------
enum VcType {
    case select
    case search
    case change
}

// MARK: [Class or Struct] ----------
class OrderStorePopupViewController: UIViewController {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var goingToMenuButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var popupViewHeight: NSLayoutConstraint!
    
    // MARK: [Let Or Var] ----------
    // 데이터 추가시 수정
    var storeData: StoreModel?
    
    var topVC: VcType?
  
    // MARK: [Override] ----------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configStoreInfo()
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 20
    }
    
    // MARK: [@IBAction] ----------
    @IBAction func tapCloseButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tapGoingToMenuButton(_ sender: Any) {
       tapOrderButton(sender)
    }
    
    
    @IBAction func tapOrderButton(_ sender: Any) {
        self.presentedViewController
        self.presentingViewController
        if topVC == .change {
            if let pvc = self.presentingViewController?.presentingViewController as? UITabBarController {
                if let nvc = pvc.selectedViewController as? UINavigationController {
                    if let tvc = nvc.topViewController as? OrderProductListViewController {
                        if let vc = self.presentingViewController {
                            
                            let selectedStore = UserDefaults.standard.string(forKey: "selectedStore") ?? ""
                            UserDefaults.standard.removeObject(forKey: selectedStore)
                            
                            UserDefaults.standard.removeObject(forKey: "selectedStore")
                            UserDefaults.standard.set(storeData?.name, forKey: "selectedStore")
                            
                            tvc.storeData = self.storeData
                            NotificationCenter.default.post(name: .changeStoreButtonTitle, object: nil)
                            NotificationCenter.default.post(name: .changeShoppingBasketCount, object: nil)
                            
                            self.dismiss(animated: false) {
                                vc.dismiss(animated: true)
                            }
                        }
                    }
                }
            }
        } else {
            if let pvc = self.presentingViewController as? UITabBarController {
                if let nvc = pvc.selectedViewController as? UINavigationController {
                    self.dismiss(animated: false) {
                        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "orderListVC") as? OrderProductListViewController else { return }
                        vc.storeData = self.storeData
                        nvc.viewControllers.first?.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
    
    // MARK: [Function] ----------
    func configStoreInfo() {
        if let storeData = storeData {
            titleLabel.text = "'\(storeData.name)'에서\n주문하시겠습니까?"
            
            contentLabel.text = storeData.isOn ? "주문 확인 후 취소가 불가합니다." : "매장 준비중 입니다."
            goingToMenuButton.isHidden = storeData.isOn ? true : false
            
            popupViewHeight.constant = storeData.isOn ? view.frame.height * 0.6 : view.frame.height * 0.7
            
            orderButton.isEnabled = storeData.isOn ? true : false
            orderButton.backgroundColor = storeData.isOn ? .done() : .gray
        }
    }
}

