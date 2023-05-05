//
//  SearchStoreViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

class OrderSearchStoreViewController: UIViewController {
    
    @IBOutlet weak var storeListTableView: UITableView!
    
    // 메인 데이터
    var shuffleStores = [StoreModel]()
    var shufflePagingStores = [StoreModel]()

    var filteredStores = [StoreModel]()
    var filteredPagingStores = [StoreModel]()
    
    var hasNextPage = false
    var isFiltering = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // 매장정보 무작위 섞기
        shuffleStores = StoreModel.storeDatas.shuffled()
        
        let nibName = UINib(nibName: "OrderStoreInfoTableViewCell", bundle: nil)
        storeListTableView.register(nibName, forCellReuseIdentifier: "storeCell")
        storeListTableView.keyboardDismissMode = .onDrag

        fetching()
    }
        
    @IBAction func tapCloseButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func fetching() {
        var datas = [StoreModel]()
        var index = 0
        
        if isFiltering {
            index = filteredPagingStores.count
            
            for i in index...(index + 9) {
                if i == filteredStores.count {
                    hasNextPage = false
                    break
                } else {
                    datas.append(filteredStores[i])
                    hasNextPage = true
                }
            }
            
            filteredPagingStores.append(contentsOf: datas)
        } else {
            index = shufflePagingStores.count
            
            for i in index...(index + 9) {
                if i == shuffleStores.count {
                    hasNextPage = false
                    break
                } else {
                    datas.append(shuffleStores[i])
                    hasNextPage = true
                }
            }
            
            shufflePagingStores.append(contentsOf: datas)
        }
        
        DispatchQueue.main.async {
            self.storeListTableView.reloadData()
        }
    }
}

extension OrderSearchStoreViewController: UITableViewDataSource {
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
            return isFiltering ? filteredPagingStores.count : shufflePagingStores.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? OrderSearchStoreTableViewCell else { return UITableViewCell() }
            searchCell.delegate = self

            return searchCell
        } else if indexPath.section == 1 {
            guard let storeCell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
            
            storeCell.delegate = self
            storeCell.isSearch = true
            
            if isFiltering {
                storeCell.configData(storeData: filteredPagingStores[indexPath.row])
            } else {
                storeCell.configData(storeData: shufflePagingStores[indexPath.row])
            }
            return storeCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as? OrderMoreStoresButtonTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
}

extension OrderSearchStoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            loadPopupView(storeData: filteredPagingStores[indexPath.row], topVC: VcType.search)
        } else {
            loadPopupView(storeData: shufflePagingStores[indexPath.row], topVC: VcType.search)
        }
    }
}

extension OrderSearchStoreViewController: OrderMoreStoresButtonTableViewCellDelegate {
    func fetchPagingProducts() {
        fetching()
    }
}

extension OrderSearchStoreViewController: OrderSearchStoreTableViewCellDelegate {
    func searchButtonClicked(text: String, state: Bool) {
        if state {
            isFiltering = state
            filteredStores.removeAll()
            filteredPagingStores.removeAll()
            filteredStores = shuffleStores.filter({$0.name.contains(text)})
        } else {
            isFiltering = state
            shufflePagingStores.removeAll()
        }
        fetching()
    }
}

extension OrderSearchStoreViewController: StoreInfoTableViewCellDelegate {
    func updateLikeButton(index: Int) {
        
        if isFiltering {
            filteredPagingStores[index].bookMark.toggle()
        } else {
            shufflePagingStores[index].bookMark.toggle()
        }
        
        DispatchQueue.main.async {
            self.storeListTableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .none)
        }
    }
}
