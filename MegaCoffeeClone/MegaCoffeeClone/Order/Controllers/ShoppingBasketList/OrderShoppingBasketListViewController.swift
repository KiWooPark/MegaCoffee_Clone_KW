//
//  OrderShoppingBasketListViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/28.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderShoppingBasketListViewController: UIViewController {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var shoppingBasketListTableView: UITableView!
    @IBOutlet weak var storeNameLabel: UILabel!
    
    // MARK: [Let Or Var] ----------
    var shoppingBasketList = [ShoppingBasketModel]()
    var storeData: StoreModel?

    // MARK: [Override] ----------
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "OrderShoppingBasketListTableViewCell", bundle: nil)
        shoppingBasketListTableView.register(nibName, forCellReuseIdentifier: "menuCell")
        shoppingBasketListTableView.tableHeaderView?.frame.size.height = 50
        
        getShoppingBasketList()
        storeNameLabel.text = storeData?.name ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
//    func getImage(name: String) -> UIImage {
//        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let directoryPath = documentPath.appendingPathComponent("shoppingBasketImage")
//        let resultUrl = directoryPath.appendingPathComponent(name)
//        return UIImage(contentsOfFile: resultUrl.path) ?? UIImage()
//    }
    
    // MARK: [@IBAction] ----------
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapOrderButton(_ sender: Any) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "paymentVC") as? OrderPaymentViewController else { return }
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: [Function] ----------
    // 매장별로 키값 바꾸기
    func getShoppingBasketList() {
        let decoder = PropertyListDecoder()
        
        do {
            if let data = UserDefaults.standard.value(forKey: "\(storeData?.name ?? "")") as? Data {
                let result = try decoder.decode([ShoppingBasketModel].self, from: data)
                
                shoppingBasketList = result

                DispatchQueue.main.async {
                    self.shoppingBasketListTableView.reloadData()
                }
            }
        } catch let e {
            print(e.localizedDescription)
        }
    }
}

// MARK: [TableView - DataSource] ----------
extension OrderShoppingBasketListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return shoppingBasketList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? OrderShoppingBasketHeaderTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = "주문 상품"
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? OrderShoppingBasketListTableViewCell else { return UITableViewCell() }
            
            cell.delegate = self
            cell.configData(menu: shoppingBasketList[indexPath.row])
            
            cell.deleteButton.tag = indexPath.row
            cell.minusButton.tag = indexPath.row
            cell.plusButton.tag = indexPath.row
    
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell")
            return cell!
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as? OrderShoppingBasketOrderTableViewCell else { return UITableViewCell() }
            cell.configButton(isOn: storeData?.isOn ?? false)
            
            var sum = 0
            
            for menu in shoppingBasketList {
                sum += menu.price * menu.count
            }
            
            cell.totalPriceLabel.text = "\(sum)원"
            return cell
        }
    }
}

// MARK: [TableView - Delegate] ----------
extension OrderShoppingBasketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 2 {
            return 50
        }
        return UITableView.automaticDimension
    }
    
    // separator 없애기
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0,2,3:
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        case 1:
            if indexPath.row == shoppingBasketList.count - 1 {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        default:
            print("")
        }
    }
}

// MARK: [Extention Delegate] ----------
extension OrderShoppingBasketListViewController: OrderShoppingBasketListTableViewCellDelegate {
    func deleteMenu(index: Int) {
        shoppingBasketList.remove(at: index)
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(shoppingBasketList)
            UserDefaults.standard.set(data, forKey: "\(storeData?.name ?? "")")
            
            DispatchQueue.main.async {
                self.shoppingBasketListTableView.reloadData()
            }
        } catch let e {
            print(e.localizedDescription)
        }
    }
    
    func minusMenuCount(index: Int) {
        
        if shoppingBasketList[index].count != 1 {
            shoppingBasketList[index].count -= 1
            
            shoppingBasketList[index].totalPrice = shoppingBasketList[index].price * shoppingBasketList[index].count
            
            DispatchQueue.main.async {
                self.shoppingBasketListTableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .none)
                self.shoppingBasketListTableView.reloadSections(IndexSet(integer: 3), with: .none)
            }
        }
    }
    
    func plusMenuCount(index: Int) {
        
        shoppingBasketList[index].count += 1
        
        shoppingBasketList[index].totalPrice = shoppingBasketList[index].price * shoppingBasketList[index].count
        
        DispatchQueue.main.async {
            self.shoppingBasketListTableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .none)
            self.shoppingBasketListTableView.reloadSections(IndexSet(integer: 3), with: .none)
        }
    }
}
