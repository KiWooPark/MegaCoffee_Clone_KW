//
//  GiftContactTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/29.
//

import UIKit

class GiftContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.textColor = UIColor.systemGray3
        phoneNumberLabel.textColor = UIColor.systemGray3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteContactClicked(_ sender: UIButton) {
    }
}
