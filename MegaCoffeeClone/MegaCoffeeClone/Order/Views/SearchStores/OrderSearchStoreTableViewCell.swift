//
//  SearchStoreTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

protocol OrderSearchStoreTableViewCellDelegate: AnyObject {
    func searchButtonClicked(text: String, state: Bool)
}

class OrderSearchStoreTableViewCell: UITableViewCell {

    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: OrderSearchStoreTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

       configSearchBar()
    }

    func configSearchBar() {
        searchBar.delegate = self
        
        searchBar.placeholder = "지점명으로 검색"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension OrderSearchStoreTableViewCell: UISearchBarDelegate {

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
