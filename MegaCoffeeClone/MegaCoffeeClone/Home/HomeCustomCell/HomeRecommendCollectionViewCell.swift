//
//  HomeRecommendCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/18.
//

import UIKit

class HomeRecommendCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var homeview: UIView!
    
    @IBOutlet weak var homeBackView: UIView!
    @IBOutlet weak var homeRecommendMenu: UIImageView!
    
    @IBOutlet weak var homeRecommendLabel: UILabel!
    
    var data: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

}
