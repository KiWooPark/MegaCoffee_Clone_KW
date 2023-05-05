//
//  OrderMenuDetailViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

class OrderMenuDetailViewController: UIViewController {
    
    @IBOutlet weak var menuDetailTableView: UITableView!
    
    var shoppingBasketButton: UIButton = {
        let button = ShoppingBasketButton()
        button.tintColor = .black
        return button
    }()
    
    var menuData: Menu1.MenuModel1?
    
    var recomendMenuData: [RecomendMenuModel]?
    var storeData: StoreModel?
    
    var menuCount = 1
    var menuPrice = 0
    var recomendPrice = 0
    var sum = 0
    
    var isOpen = true
    
    var selectedPriceList = [Int]()
    var recommendMenuPricesList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuPrice = menuData?.price ?? 0
        
        sum = menuData?.price ?? 0
        
        selectedPriceList = Array(repeating: 0, count: menuData?.option?.count ?? 0)
        
        recomendMenuData = RecomendMenuModel.fetchMenuData()
        
        let safeAreaTop = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        let safeAreaBottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        
        menuDetailTableView.contentInset = UIEdgeInsets(top: -safeAreaTop, left: 0, bottom: -safeAreaBottom, right: 0)
        menuDetailTableView.sectionHeaderHeight = 0
        
        configShoppingBasketButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let decoder = PropertyListDecoder()
        
        do {
            if let data = UserDefaults.standard.value(forKey: "\(storeData?.name ?? "")") as? Data {
                let result = try decoder.decode([ShoppingBasketModel].self, from: data)
                
                if let countLabel = shoppingBasketButton.subviews.last as? ShoppingBasketLabel {
                    DispatchQueue.main.async {
                        countLabel.text = "\(result.count)"
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    
    func configShoppingBasketButton() {
        shoppingBasketButton.addTarget(self, action: #selector(tapShoppingBasketButton), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: shoppingBasketButton)
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func tapShoppingBasketButton() {
        let storyBoard = UIStoryboard(name: "ShoppingBasketList", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "shoppingBasketVC") as? OrderShoppingBasketListViewController else { return }
        vc.storeData = storeData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension OrderMenuDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return CGFloat.leastNormalMagnitude
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            isOpen.toggle()
            tableView.reloadSections(IndexSet(integer: 2), with: .fade)
        }
    }
}

extension OrderMenuDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return isOpen ? menuData?.option?.count ?? 0 : 0
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? OrderMenuDetailTableViewCell else { return UITableViewCell() }
            
            if let data = menuData {
                cell.configData(menuData: data)
            }
            
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") else { return UITableViewCell() }
            return cell
            
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell2", for: indexPath) as? OrderMenuDetail2TableViewCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            guard let optionData = menuData?.option?[indexPath.row] else { return UITableViewCell() }
            
            cell.configOptionButton(optionData: optionData)
            cell.row = indexPath.row
            cell.delegate = self
            
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell3", for: indexPath) as? OrderMenuDetail3TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configData(count: menuCount, sum: sum)
            
            return cell
        } else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell4", for: indexPath) as? OrderMenuDetail4TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            
            var isSelects = [Bool]()
            
            for i in 0..<(recomendMenuData?.count ?? 0) {
                recomendMenuData?[i].isSelect == true ? isSelects.append(true) : isSelects.append(false)
            }
            
            cell.configLayout(isSoldOut: menuData?.soldOut ?? false, indexs: isSelects)
            cell.configData(data: recomendMenuData, sum: sum + recomendPrice)
            return cell
        }
        return UITableViewCell()
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail2TableViewCellDelegate {
    func updateCount(row: Int, index: Int, count: Int) {
        menuData?.option?[row].details?[index].count = count
    }
    
    func changeSection2(row: Int, buttonIndex: Int) {
        
        let index = menuData?.option?[row].details?.firstIndex(where: {$0.isSelect == true}) ?? 0
        menuData?.option?[row].details?[index].isSelect = false
        menuData?.option?[row].details?[buttonIndex].isSelect = true
        
        selectedPriceList[row] = menuData?.option?[row].details?[buttonIndex].price ?? 0
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        DispatchQueue.main.async {
            self.menuDetailTableView.reloadSections(IndexSet(3...4), with: .none)
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail3TableViewCellDelegate {
    func changeSection3(count: Int) {
        menuCount = count
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        DispatchQueue.main.async {
            self.menuDetailTableView.reloadSections(IndexSet(3...4), with: .none)
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail4TableViewCellDelegate {
    func changeSection4(index: Int) {
        
        recomendMenuData?[index].isSelect?.toggle()
        
        recomendPrice = 0
        
        recomendMenuData?.forEach({ menu in
            if menu.isSelect ?? false {
                recomendPrice += menu.price ?? 0
            }
        })
        
        DispatchQueue.main.async {
            self.menuDetailTableView.reloadSections(IndexSet(4...4), with: .none)
        }
    }
    
    func putShoppingBasket() {
    
        var shoppingBasketData = getShoppingBasketMenus()

        if shoppingBasketData.isEmpty {

            // 메인 메뉴 데이터 생성
            let options = filterOptions()
            let menu = ShoppingBasketModel(productName: menuData?.name ?? "",
                                           productImage: menuData?.image ?? "",
                                           options: options,
                                           count: menuCount,
                                           price: menuData?.price ?? 0,
                                           totalPrice: 0)

            shoppingBasketData.append(menu)

            // 추천 메뉴 데이터 생성
            if let recomendMenus = createRecomendMenuData() {
                shoppingBasketData.append(contentsOf: recomendMenus)
            }

            saveUserDefaults(shoppingBasketData: shoppingBasketData)
        } else {

            // 같은 이름, 같은 옵션이 있으면
            if shoppingBasketData.contains(where: {$0.productName == menuData?.name && $0.options == filterOptions()}) {

                if let index = shoppingBasketData.firstIndex(where: {$0.productName == menuData?.name && $0.options == filterOptions()}) {
                    shoppingBasketData[index].count += menuCount
                } else {
                    let options = filterOptions()
                    let menu = ShoppingBasketModel(productName: menuData?.name ?? "",
                                                   productImage: menuData?.image ?? "",
                                                   options: options,
                                                   count: menuCount,
                                                   price: menuData?.price ?? 0,
                                                   totalPrice: 0)

                    shoppingBasketData.append(menu)
                }

                // 추천 메뉴 데이터 생성
                if let recomendMenus = createRecomendMenuData() {
                    shoppingBasketData.append(contentsOf: recomendMenus)
                }
            } else { // 같은 이름이 없다면
                let options = filterOptions()
                let menu = ShoppingBasketModel(productName: menuData?.name ?? "",
                                               productImage: menuData?.image ?? "",
                                               options: options,
                                               count: menuCount,
                                               price: menuData?.price ?? 0,
                                               totalPrice: 0)

                shoppingBasketData.append(menu)

                // 추천 메뉴 데이터 생성
                if let recomendMenus = createRecomendMenuData() {
                    shoppingBasketData.append(contentsOf: recomendMenus)
                }
            }
            saveUserDefaults(shoppingBasketData: shoppingBasketData)
        }

        if let countLabel = shoppingBasketButton.subviews.last as? ShoppingBasketLabel {
            DispatchQueue.main.async {
                countLabel.text = "\(self.getShoppingBasketMenus().count)"
            }
        }

        let storyBoard = UIStoryboard(name: "ShoppingBasketList", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "shoppingBasketVC") as? OrderShoppingBasketListViewController else { return }
        vc.storeData = storeData
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func createRecomendMenuData() -> [ShoppingBasketModel]? {

        var recomendMenus = [ShoppingBasketModel]()
        
        recomendMenuData?.forEach({ recomendMenu in
            if recomendMenu.isSelect ?? false {
                let menu = ShoppingBasketModel(productName: recomendMenu.name ?? "",
                                           productImage: recomendMenu.image ?? "",
                                           options: [],
                                           count: 1,
                                           price: recomendMenu.price ?? 0,
                                           totalPrice: recomendMenu.price ?? 0)
                
                recomendMenus.append(menu)
            }
        })
        
        return recomendMenus
    }
    
    func saveUserDefaults(shoppingBasketData: [ShoppingBasketModel]) {
        // 데이터 저장만
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(shoppingBasketData)
            UserDefaults.standard.set(data, forKey: "\(storeData?.name ?? "")")
        } catch {
            print(error)
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            if let data = UserDefaults.standard.value(forKey: "\(storeData?.name ?? "")") as? Data {
                let result = try decoder.decode([ShoppingBasketModel].self, from: data)
                print("저장된 데이터",result)
                
                // 유저 디폴트 데이터 지우기
//                for key in UserDefaults.standard.dictionaryRepresentation().keys {
//                    UserDefaults.standard.removeObject(forKey: key)
//                }
                
            } else {
                print("없음")
            }
        } catch {
            print(error)
        }
    }
    
    func getShoppingBasketMenus() -> [ShoppingBasketModel] {
        
        guard let storeData = storeData,
              let data = UserDefaults.standard.value(forKey: "\(storeData.name)") as? Data else {
            return []
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            let result = try decoder.decode([ShoppingBasketModel].self, from: data)
            return result
        } catch {
            print(error)
            return []
        }
    }
    
    func filterOptions() -> [String] {
        
        var options = [String]()
        
        // 옵션 이름만 분류
        menuData?.option?.forEach({ option in
            option.details?.forEach({ detailOption in
                if detailOption.isSelect == true {
                    options.append(detailOption.name ?? "")
                }
            })
        })
        return options
    }
    
//         이미지 불러오기
//         저장된 URL로
//                    do {
//                        let image = try UIImage(contentsOfFile: resultUrl.path)
//                        print(image)
//                    } catch {
//
//                    }
    
    // 이미지 URL 가져오기
    func saveImage() {
        do {
            if let imageData = UIImage(named: menuData?.image ?? "")?.pngData() {
                let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let directoryPath = documentPath.appendingPathComponent("shoppingBasketImage")
                let resultUrl = directoryPath.appendingPathComponent("\(menuData?.image ?? "")")
                
                // 폴더 경로 체크
                if !FileManager.default.fileExists(atPath: directoryPath.path) {
                    // 폴더 생성
                    try FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: false, attributes: nil)
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                } else {
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                }
            }
        } catch let e {
            print(e.localizedDescription)
        }
    }
}
