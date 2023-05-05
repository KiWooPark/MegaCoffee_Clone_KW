//
//  OrderSearchProductTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

protocol OrderSearchProductTableViewCellDelegate: AnyObject {
    func searchButtonClicked(text: String, state: Bool)
}

class OrderSearchProductTableViewCell: UITableViewCell {

    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: OrderSearchProductTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        configSearchBar()
    }
    
    func configSearchBar() {
        searchBar.delegate = self
        
        searchBar.placeholder = "상품명으로 검색"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension OrderSearchProductTableViewCell: UISearchBarDelegate {
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if text == "" {
                delegate?.searchButtonClicked(text: text, state: false)
            } else {
                delegate?.searchButtonClicked(text: text, state: true)
            }
        }
    }
}
