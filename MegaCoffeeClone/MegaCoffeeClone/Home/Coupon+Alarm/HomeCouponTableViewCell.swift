//
//  HomeCouponTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/07.
//

import UIKit

class HomeCouponTableViewCell: UITableViewCell {

    @IBOutlet weak var HomeCouponImage: UIImageView!
    @IBOutlet weak var HomeCouponPlace: UILabel!
    @IBOutlet weak var HomeCouponMenu: UILabel!
    @IBOutlet weak var HomeCouponPeriod: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
