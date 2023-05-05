//
//  HomeAlarmTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/07.
//

import UIKit

class HomeAlarmTableViewCell: UITableViewCell {
    @IBOutlet weak var HomeStampName: UILabel!
    @IBOutlet weak var HomeStampReward: UILabel!
    @IBOutlet weak var HomeStampDate: UILabel!
    
  

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
//    @IBAction func couponAction(_ sender: UIButton) {
//
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "HomeStampViewController") else { return }
//          self.present(nextVC, animated: true)
//    }
//
//    }
//
//    //@IBAction func stampAction(_ sender: Any) {
//
//    //}
//HomeStampViewController.modalPresentationStyle = .fullScreen


