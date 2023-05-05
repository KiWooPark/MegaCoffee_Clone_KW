//
//  HomeCouponHistoryTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/12/12.
//

import UIKit

class HomeCouponHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var homeCouponHistoryImage: UIImageView!
    
    @IBOutlet weak var homeCouponHistoryWhen: UILabel!
    
    @IBOutlet weak var homeCouponHistoryMenu: UILabel!
    
    @IBOutlet weak var homeCouponHistoryUes: UILabel!
    
    @IBOutlet weak var homeCouponHistoryPeriod: UILabel!
    
    @IBOutlet weak var homeCouponNoView: UIView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()



    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        


    }
    
}
