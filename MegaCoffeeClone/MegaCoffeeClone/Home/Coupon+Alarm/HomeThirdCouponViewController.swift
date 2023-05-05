//
//  HomeThirdCouponViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/12/12.
//

import UIKit

class HomeThirdCouponViewController: UIViewController {

    @IBOutlet weak var tableVirw: UITableView!
    
    var homeCouponHistoryImage: Array<String> = ["homeRecommend1","homeRecommend2"]
    
    var homeCouponHistoryMenu: Array<String> = ["강남 로데오점","왕십리역점"]
    var homeCouponHistoryUes: Array<String> = ["아이스 아메리카노","따끈따끈간식꾸러미세트"]
    var homeCouponHistoryPeriod: Array<String> = ["유효기간: ~ 11.07","유효기간 ~ 11.09"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "HomeCouponHistoryTableViewCell", bundle: nil)
        tableVirw?.register(nib, forCellReuseIdentifier: "HomeCouponHistoryTableViewCell")
        
        
    }
    
}

extension HomeThirdCouponViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeCouponHistoryImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCouponHistoryTableViewCell", for: indexPath) as! HomeCouponHistoryTableViewCell
        
        cell.homeCouponHistoryImage.image = UIImage(named: homeCouponHistoryImage[indexPath.row])
        cell.homeCouponHistoryMenu.text =  homeCouponHistoryMenu[indexPath.row]
        cell.homeCouponHistoryUes.text =  homeCouponHistoryUes[indexPath.row]
        cell.homeCouponHistoryPeriod.text =  homeCouponHistoryPeriod[indexPath.row]
        
        
        return cell
    }
    
    
}
