//
//  PopUpViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/17.
//

import UIKit

class GiftPopUpViewController: ViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.clipsToBounds = true
        popUpView.layer.cornerRadius = 15
        
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
