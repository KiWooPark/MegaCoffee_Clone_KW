//
//  GiftShoppingBasketVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/14.
//
//ShoppingBasket에 대한 모델을 만들어 DetailViewController에서 넣은 값들을 불러오자

import UIKit
import CoreData

class GiftShoppingBasketVC: UIViewController, CanCelDelegate, GoToPaymentView {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    var location: Int?
    
    let coreDataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppingTableView.register(UINib(nibName: "GiftShoppingBasketTableViewCell", bundle: nil), forCellReuseIdentifier: "tableShoppingCell")
        coreDataManager.loadItem()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //뒤로가는 버튼을 눌렀을때 일괄적으로 데이터를 저장해주기(ex) 상품의 개수)
        
    }
    
    //(delegate함수) 쇼핑카트뷰에 상품의 x버튼 클릭시
    func cancelClicked(index: Int) {
        coreDataManager.context.delete(coreDataManager.itemArray[index])

        coreDataManager.itemArray.remove(at: index)
                
        if coreDataManager.itemArray.count == 0 {
            let alert = UIAlertController(title: "", message: "장바구니에 담긴 상품이 없습니다.선물하기 메인 화면으로 이동합니다.", preferredStyle: UIAlertController.Style.alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
                   }
            alert.addAction(confirmAction)
            present(alert, animated: false, completion: nil)

        }
        coreDataManager.loadItem()
        
        shoppingTableView.reloadData()
        
        

    }
    
    func orderClicked() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "paymentView") as? GiftPaymentVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension GiftShoppingBasketVC: UITableViewDelegate {
    
}

extension GiftShoppingBasketVC: UITableViewDataSource {
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "주문가능한 상품"
        }else if section == 1 {
            return "장바구니에 담은 상품은 최대 30일간 보관됩니다."
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return coreDataManager.itemArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableShoppingCell", for: indexPath) as! GiftShoppingBasketTableViewCell
            cell.productImageview.image = UIImage()
            cell.nameLabel.text = coreDataManager.itemArray[indexPath.row].name!
            cell.priceLabel.text = "\(coreDataManager.itemArray[indexPath.row].total)"
            cell.numberOfLabel.text = "\(coreDataManager.itemArray[indexPath.row].number)"
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            location = indexPath.row
            cell.row = indexPath.row
            cell.cancelDelegate = self
            cell.number = Int(cell.numberOfLabel.text!)!
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! GiftShoppingOrderTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            var totalNumber = 0
            for item in coreDataManager.itemArray {
                totalNumber += Int(item.total)
            }
            cell.allTotalPriceLabel.text = "\(totalNumber)원"
            cell.goToPaymentView = self
            return cell
        }
        
    }
    
    
    
}
