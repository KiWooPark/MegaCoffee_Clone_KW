//
//  GiftMovePopupVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/15.
//

import UIKit

class GiftMovePopupVC: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    
//    var vcRef: UIViewController?
    
    var PopupDelegate: PopupDelegate?
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 15

    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func moveToButtonClicked(_ sender: UIButton) {
        
        //MARK: - 직접 VC를 가져올때
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
//        self.dismiss(animated: false) {
//            self.vcRef?.navigationController?.pushViewController(vc, animated: true)
//        }
        
        //MARK: - PopupDelegate Protocol을 사용할때
        self.dismiss(animated: false)
        PopupDelegate?.goShoppingButtonClicked()
        
        
        

        
    }
    
    

    
}

