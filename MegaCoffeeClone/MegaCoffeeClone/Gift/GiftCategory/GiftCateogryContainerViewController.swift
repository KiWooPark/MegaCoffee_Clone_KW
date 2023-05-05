//
//  CateogryViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/26.
//

import UIKit

class GiftCategoryContainerViewController: ViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    var filteredMenu = [MenuModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giftCategory[0].isClicked = true
        filteredMenu = Menu.filter({$0.type.rawValue == MenuType.set.rawValue})
        
        self.categoryTableView.register(UINib(nibName: "GiftCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCustomCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for (index,_) in giftCategory.enumerated() {
            giftCategory[index].isClicked = false
        }
    }
}

extension GiftCategoryContainerViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! GiftCategoryCollectionViewCell
        cell.categoryLabel.text = giftCategory[indexPath.row].categoryName
        cell.tag = indexPath.row
        
        if giftCategory[indexPath.row].isClicked {
            cell.categoryView.layer.cornerRadius = 22
            cell.categoryView.layer.borderWidth = 0
            cell.categoryView.layer.borderColor = UIColor.lightGray.cgColor
            cell.categoryView.backgroundColor = UIColor.black
            cell.categoryLabel.font = .boldSystemFont(ofSize: 18)
            cell.categoryLabel.textColor = UIColor.white
            
        } else {
            cell.categoryView.layer.cornerRadius = 22
            cell.categoryView.layer.borderWidth = 1
            cell.categoryView.layer.borderColor = UIColor.lightGray.cgColor
            cell.categoryView.backgroundColor = UIColor.white
            cell.categoryLabel.font = .boldSystemFont(ofSize: 18)
            cell.categoryLabel.textColor = UIColor.lightGray
        }
        
        return cell
    }
    
}

extension GiftCategoryContainerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) {

            filteredMenu.removeAll()
            filteredMenu = Menu.filter({$0.type.rawValue == cell.tag})
            
            categoryTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            
            for (index,_) in giftCategory.enumerated() {
                giftCategory[index].isClicked = index == cell.tag ? true : false

                filteredMenu = Menu.filter({$0.type.rawValue == cell.tag})

                categoryCollectionView.reloadData()
                
            }
        }
        
    }
}

extension GiftCategoryContainerViewController: UITableViewDelegate {
    

    
}

extension GiftCategoryContainerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenu[0].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCustomCell", for: indexPath) as! GiftCategoryTableViewCell
        cell.productImageView.image = filteredMenu[0].products[indexPath.row].image
        cell.prodcutNameLabel.text = filteredMenu[0].products[indexPath.row].name
        cell.productPriceLabel.text = "\(filteredMenu[0].products[indexPath.row].price)원"
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.sizeToFit()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc =  storyboard?.instantiateViewController(identifier: "DetailView") as? GiftDetailViewController else
                { return }
        vc.productInfo = filteredMenu[0].products[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
