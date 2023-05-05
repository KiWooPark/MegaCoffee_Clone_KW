//
//  HomeStampViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/08.
//

import UIKit

class HomeStampViewController: UIViewController {

    @IBOutlet weak var HomeStamp: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeStamp?.layer.cornerRadius = 20
    }
    
    
    
}
