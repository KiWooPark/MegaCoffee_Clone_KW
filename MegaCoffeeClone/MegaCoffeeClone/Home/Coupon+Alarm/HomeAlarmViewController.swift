//
//  HomeAlarmViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/07.
//

import UIKit

class HomeAlarmViewController: UIViewController {
    
    @IBOutlet weak var HomeAlarmTableView: UITableView!
    
    var HomeStampName: Array<String> = ["스탬프","쿠폰"]
    var HomeStampReward: Array<String> = ["스탬프 1개가 적립되었습니다","새로운 쿠폰이 적립되었습니다."]
    var HomeStampDate: Array<String> = ["2022.11.01 15:00","2022.10.30 12:34"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeAlarmTableViewCell", bundle: nil)
        
        HomeAlarmTableView.register(nib, forCellReuseIdentifier: "HomeAlarmTableViewCell")

    }
   

}
extension HomeAlarmViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeStampName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = HomeAlarmTableView.dequeueReusableCell(withIdentifier: "HomeAlarmTableViewCell") as! HomeAlarmTableViewCell
        
        cell.HomeStampName.text =  HomeStampName[indexPath.row]
        cell.HomeStampReward.text =  HomeStampReward[indexPath.row]
        cell.HomeStampDate.text =  HomeStampDate[indexPath.row]
        return cell 
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeStampViewController")
        as? HomeStampViewController
       
       
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
