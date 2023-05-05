//
//  OrderSearchMenuViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderSearchProductViewController: UIViewController {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var searchProductTableView: UITableView!
    
    // MARK: [Let Or Var] ----------
    // 더미데이터에서 다시 만든 상품
    var menus = [Menu1.MenuModel1]()
    var searchPagingProducts = [Menu1.MenuModel1]()
    
    // 필터링된 데이터 전부
    var filteredProducts = [Menu1.MenuModel1]()
    var filteredPagingProducts = [Menu1.MenuModel1]()
    
    var hasNextPage = false
    var isFiltering = false
    
    // MARK: [Override] ----------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productCellNib = UINib(nibName: "OrderProductTableViewCell", bundle: nil)
        searchProductTableView.register(productCellNib, forCellReuseIdentifier: "product1ColumnCell")
        
        searchProductTableView.keyboardDismissMode = .onDrag
        configSearchProducts()
        fetchPaging()
    }
    
    // MARK: [@IBAction] ----------
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: [Function] ----------
    func configSearchProducts() {
        
        var data = Menu1.fetchMenuData()

        for i in data.indices {
            for j in data[i].menus.indices {
                data[i].menus[j].category = data[i].type
            }
        }

        data.forEach { data in
            menus.append(contentsOf: data.menus)
        }
        
        menus.shuffle()
    }
    
    func fetchPaging() {

        if isFiltering {
            let index = filteredPagingProducts.count
            
            for i in index...(index + 9) {
                if i == filteredProducts.count {
                    hasNextPage = false
                    break
                } else {
                    filteredPagingProducts.append(filteredProducts[i])
                    hasNextPage = true
                }
            }
        } else {
            let index = searchPagingProducts.count
            
            for i in index...(index + 9) {
                if i == menus.count {
                    hasNextPage = false
                    break
                } else {
                    searchPagingProducts.append(menus[i])
                    hasNextPage = true
                }
            }
        }
        
        DispatchQueue.main.async {
            self.searchProductTableView.reloadData()
        }
    }
}


// MARK: [TableView - DataSource] ----------
extension OrderSearchProductViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if hasNextPage {
            return 3
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return 1
        } else if section == 1 {
            return isFiltering ? filteredPagingProducts.count : searchPagingProducts.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? OrderSearchProductTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "product1ColumnCell", for: indexPath) as? OrderProductTableViewCell else { return UITableViewCell() }
            
            if isFiltering {
                cell.configData(menu: filteredPagingProducts[indexPath.row])
                return cell
            } else {
                cell.configData(menu: searchPagingProducts[indexPath.row])
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as? OrderMoreProductsButtonTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
}

// MARK: [Extention Delegate] ----------
extension OrderSearchProductViewController: OrderMoreProductsButtonTableViewCellDelegate {
    func fetchPagingProducts() {
        fetchPaging()
    }
}
  
extension OrderSearchProductViewController: OrderSearchProductTableViewCellDelegate {
    
    func searchButtonClicked(text: String, state: Bool) {
        if state {
            isFiltering = state
            filteredProducts.removeAll()
            filteredPagingProducts.removeAll()
            filteredProducts = menus.filter({ menu in
                if let name = menu.name {
                    if name.contains(text) {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            })
        } else {
            isFiltering = state
            searchPagingProducts.removeAll()
        }
        fetchPaging()
    }
}
