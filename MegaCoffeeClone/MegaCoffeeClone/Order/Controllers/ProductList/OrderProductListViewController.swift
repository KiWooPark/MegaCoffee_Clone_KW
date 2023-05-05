//
//  OrderListViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

class OrderProductListViewController: UIViewController {

    @IBOutlet weak var productListCollectionView: UICollectionView!
    @IBOutlet weak var changeStoreButton: UIButton!
    @IBOutlet weak var shoppingBasketBottomButton: UIButton!
    @IBOutlet weak var shoppingCountView: UIView!
    @IBOutlet weak var shoppingCountLabel: UILabel!
    
    var is1Column = false
    var storeData: StoreModel?

    var categoryProducts = [Menu1.MenuModel1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        configNavigationBarReightButton()
        
        productListCollectionView.collectionViewLayout = getLayout()
        
        let Colume1 = UINib(nibName: "OrderProduct1ColumnCollectionViewCell", bundle: nil)
        let Colume3 = UINib(nibName: "OrderProduct3ColumnCollectionViewCell", bundle: nil)
        
        productListCollectionView.register(Colume1, forCellWithReuseIdentifier: "product1ColumnCell")
        productListCollectionView.register(Colume3, forCellWithReuseIdentifier: "product3ColumnCell")
        
        CategoryModel.categorys[0].isSelected = true
        
        categoryProducts = Menu1.fetchMenuData().filter({$0.type == "세트메뉴"})[0].menus.filter({$0.isGift == false})
    
        changeStoreButton.setTitle(storeData?.name, for: .normal)
       
        // 매장이름변경버튼 노티피케이션
        NotificationCenter.default.addObserver(forName: .changeStoreButtonTitle, object: nil, queue: .main) { _ in
            self.changeStoreButton.setTitle(self.storeData?.name, for: .normal)
        }
        
        NotificationCenter.default.addObserver(forName: .changeShoppingBasketCount, object: nil, queue: .main) { _ in
            self.configShoppingBasketCount()
        }
        
        shoppingCountView.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 카테고리 선택상태 초기화
        for (index,_) in CategoryModel.categorys.enumerated() {
            CategoryModel.categorys[index].isSelected = false
        }
        
        CategoryModel.categorys[0].isSelected = true
        
        configShoppingBasketCount()
        
    }

    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapShoppingBasketButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "ShoppingBasketList", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "shoppingBasketVC") as? OrderShoppingBasketListViewController else { return }
        vc.storeData = storeData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func makeNavigationBarRightButton(imageName: String, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.tintColor = .black
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        return barButtonItem
    }
    
    func configShoppingBasketCount() {
        let decoder = PropertyListDecoder()
        
        do {
            let selectedStore = UserDefaults.standard.string(forKey: "selectedStore") ?? ""
            if let data = UserDefaults.standard.value(forKey: selectedStore) as? Data {
                let result = try decoder.decode([ShoppingBasketModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.shoppingCountLabel.text = "\(result.count)"
                }
            } else {
                DispatchQueue.main.async {
                    self.shoppingCountLabel.text = "0"
                }
            }
        } catch {
            print(error)
        }
    }
    
    private func configNavigationBarReightButton() {
        let magnifyingglassButton = makeNavigationBarRightButton(imageName: "magnifyingglass", action: #selector(tapMagnifyingglassButton))
        
        let exclamationmarkButton = makeNavigationBarRightButton(imageName: "exclamationmark.circle", action: #selector(tapExclamationmarkButton))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 10
        
        self.navigationItem.rightBarButtonItems = [exclamationmarkButton, spacer, magnifyingglassButton]
    }
    
    @objc func tapMagnifyingglassButton() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "searchMenuVC") as? OrderSearchProductViewController else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func tapExclamationmarkButton() {
        print("2")
    }
    
    
    @IBAction func tapChangeStoreButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ChangeStorePopupVC") as? OrderChangeStorePopupViewController else { return }
        self.present(vc, animated: false)
    }
    
    
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.categorySection()
            case 1:
                if self.is1Column {
                    return self.product1ColumnSection()
                } else {
                    return self.product3ColumnSection()
                }
               
            case 2:
                return self.informationSection()
            default:
                return NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(0), heightDimension: .absolute(0))))
            }
        }
    }
    
    func categorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
    
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(5), top: .none, trailing: .none, bottom: .none)
    
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)

        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }

    
    func product3ColumnSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
     
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func product1ColumnSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func informationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
            
        return section
    }
}

 
extension OrderProductListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return CategoryModel.categorys.count
        } else if section == 1 {
            return categoryProducts.isEmpty ? 0 : categoryProducts.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catagoryCell", for: indexPath) as? OrderCategoryCollectionViewCell else { return UICollectionViewCell() }
 
            cell.categoryNameLabel.text = CategoryModel.categorys[indexPath.row].name
            cell.tag = indexPath.row
            
            if CategoryModel.categorys[indexPath.row].isSelected {
                cell.backgroundColor = .black
                cell.layer.borderColor = UIColor.black.cgColor
                cell.categoryNameLabel.textColor = .white
            } else {
                cell.backgroundColor = .white
                cell.layer.borderColor = UIColor.systemGray4.cgColor
                cell.categoryNameLabel.textColor = .darkGray
            }
            
            return cell
            
        } else if indexPath.section == 1 {
            if is1Column {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product1ColumnCell", for: indexPath) as? OrderProduct1ColumnCollectionViewCell else{ return UICollectionViewCell() }
                cell.tag = indexPath.row
                cell.configData(data: categoryProducts[indexPath.row])
                return cell
                
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product3ColumnCell", for: indexPath) as? OrderProductCollectionViewCell else { return UICollectionViewCell() }
                cell.tag = indexPath.row
                cell.configData(data: categoryProducts[indexPath.row])
                return cell
            }
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InformationCell", for: indexPath) as? InformationCollectionViewCell else { return UICollectionViewCell() }
            cell.contentLabel.text = "(주)###### 대표이사: ### | 사업자등록번호: ###-##-##### | 대표번호: ####-####\n통신판매업신고번호: 제####-#####-####호\n경기 성남시 분당구 방아로 8 매송빌딩 4층\n\n######는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 ######는 상품거래정보 및 거래에 대한 책임을 지지 않습니다."
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? OrderListHeaderCollectionReusableView else { return UICollectionReusableView() }
    
        header.countLabel.text = "\(categoryProducts.count)개"
        header.delegate = self
        
        if is1Column {
            header.changeColumnButton.setTitle("3 열 보기", for: .normal)
        } else {
            header.changeColumnButton.setTitle("1 열 보기", for: .normal)
        }
        
        return header
    }
}

extension OrderProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            for index in 0 ..< CategoryModel.categorys.count {
                CategoryModel.categorys[index].isSelected = index == indexPath.row ? true : false
            }
            
            categoryProducts.removeAll()
    
            categoryProducts = Menu1.fetchMenuData().filter({$0.type == CategoryModel.categorys[indexPath.row].name})[0].menus.filter({$0.isGift == false})
            
            DispatchQueue.main.async {
                self.productListCollectionView.reloadData()
            }
        } else {
            let storyboard = UIStoryboard(name: "OrderProductList", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "menuDetailVC") as? OrderMenuDetailViewController else { return }
            vc.menuData = categoryProducts[indexPath.row]
            vc.storeData = self.storeData
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension OrderProductListViewController: OrderListHeaderCollectionReusableViewDelegate {
    func changeColumn() {
        is1Column.toggle()
        productListCollectionView.reloadSections(IndexSet(integer: 1))
    }
}

extension OrderProductListViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }
}

