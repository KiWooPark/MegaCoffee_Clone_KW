//
//  GiftPagingButtonTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/12/10.
//

import UIKit

class GiftPagingButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var moreButton: UIButton!
    
    var showMoreDelegate: ShowMoreDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moreButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func moreButtonClicked(_ sender: UIButton) {
        showMoreDelegate?.paging()
    }
}
