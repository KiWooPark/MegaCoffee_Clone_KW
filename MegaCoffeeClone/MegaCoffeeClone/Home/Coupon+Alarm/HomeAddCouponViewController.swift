//
//  HomeAddCouponViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/12/12.
//

import UIKit

class HomeAddCouponViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBOutlet weak var addCoupon: UIView!
    
    @IBAction func addCouponn(_ sender: Any) {
        
        let sheet = UIAlertController(title: "", message: "올바른 쿠폰 번호 양식이 아닙니다.", preferredStyle: .alert)


        sheet.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { _ in print("yes 클릭") }))

        present(sheet, animated: true)
    }
}
