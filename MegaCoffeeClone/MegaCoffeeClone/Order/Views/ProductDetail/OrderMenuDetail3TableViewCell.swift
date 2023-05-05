//
//  OrderDetail3TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

protocol OrderMenuDetail3TableViewCellDelegate {
    func changeSection3(count: Int)
}

class OrderMenuDetail3TableViewCell: UITableViewCell {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var delegate: OrderMenuDetail3TableViewCellDelegate?

    var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(count: Int, sum: Int) {
        self.count = count
        
        countLabel.text = "\(count)"
        sumLabel.text = "\(sum)원"
    }
    
    @IBAction func subtractionButton(_ sender: Any) {
        if count > 1 {
            count -= 1
        }
        countLabel.text = "\(count)"
        delegate?.changeSection3(count: count)
    }
    
    @IBAction func additionButton(_ sender: Any) {
        count += 1
        countLabel.text = "\(count)"
        delegate?.changeSection3(count: count)
    }
}
