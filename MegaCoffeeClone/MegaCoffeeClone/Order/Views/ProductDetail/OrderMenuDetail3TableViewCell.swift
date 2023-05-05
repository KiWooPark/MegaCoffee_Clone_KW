//
//  OrderDetail3TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

// MARK: [Protocol] ----------
protocol OrderMenuDetail3TableViewCellDelegate: AnyObject {
    func changeSection3(count: Int)
}

// MARK: [Class or Struct] ----------
class OrderMenuDetail3TableViewCell: UITableViewCell {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: [Let Or Var] ----------
    weak var delegate: OrderMenuDetail3TableViewCellDelegate?
    var count = 0
    
    // MARK: [Override] ----------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: [@IBAction] ----------
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
    
    // MARK: [Function] ----------
    func configData(count: Int, sum: Int) {
        self.count = count
        
        countLabel.text = "\(count)"
        sumLabel.text = "\(sum)원"
    }
    
    
}
