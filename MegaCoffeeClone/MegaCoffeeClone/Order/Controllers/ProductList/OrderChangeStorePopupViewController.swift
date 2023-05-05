//
//  OrderChangeStorePopupViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/15.
//

import UIKit

enum ViewPresentationStyle {
    case push
    case present
}

class OrderChangeStorePopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 10
    }
    
    
    @IBAction func tapCancelButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tapDoneButton(_ sender: Any) {
    
        if let tvc = self.presentationController?.presentingViewController as? UITabBarController {
            if let nvc = tvc.selectedViewController as? UINavigationController {
                if let opListvc = nvc.viewControllers.last as? OrderProductListViewController {
                    
                    let storyboard = UIStoryboard(name: "Order", bundle: nil)
                    guard let vc = storyboard.instantiateViewController(withIdentifier: "orderVC") as? OrderViewController else { return }
                    
                    vc.vcPresentationStyle = .present
                    
                    self.dismiss(animated: false) {
                        opListvc.present(vc, animated: true)
                    }
                }
            }
        }
    }
}
