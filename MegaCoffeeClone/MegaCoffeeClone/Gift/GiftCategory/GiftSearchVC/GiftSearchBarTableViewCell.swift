//
//  GiftSearchBarTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/12/10.
//

import UIKit

class GiftSearchBarTableViewCell: UITableViewCell, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchBarDelegate: searchBarDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchBar.delegate = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchBarDelegate?.searchClicked(text: text)
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchBarDelegate?.resetTable()
        }
    }
    
  
   

}


