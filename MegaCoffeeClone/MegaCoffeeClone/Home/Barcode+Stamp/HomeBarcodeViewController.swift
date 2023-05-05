//
//  HomeBarcodeViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/08.
//

import UIKit

class HomeBarcodeViewController: UIViewController {

    @IBOutlet weak var HomeBarcodeView: UIView!
    
    @IBOutlet weak var HomeBarcodeClose: UIButton!
   // @IBOutlet weak var HomeCloseBarcodeBackgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeBarcodeClose.layer.cornerRadius = 200
    }
    

    @IBAction func HomeBarcodeClose(_ sender: UIButton) {
        navigationController?.popViewController(animated: true); dismiss(animated: true, completion: nil)
    }
}
