//
//  OrderChangeStorePopupViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/15.
//

import UIKit

// MARK: [Enum] ----------
enum ViewPresentationStyle {
    case push
    case present
}

// MARK: [Class or Struct] ----------
class OrderChangeStorePopupViewController: UIViewController {

    // MARK: [@IBOutlet] ----------

    @IBOutlet weak var popupView: UIView!
    
    // MARK: [Override] ----------
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 10
    }
    
    // MARK: [@IBAction] ----------
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
