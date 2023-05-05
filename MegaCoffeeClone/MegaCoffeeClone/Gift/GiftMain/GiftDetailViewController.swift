//
//  DetailViewController.swift
//  MegaCoffeeClone
//
//  Created by 준연 on 2022/10/27.
//


import UIKit
import CoreData

class GiftDetailViewController: ViewController, PopupDelegate {
   
    
    
    @IBOutlet weak var DetailMenuImageView: UIImageView!
    @IBOutlet weak var DetailMenuNameLabel: UILabel!
    @IBOutlet weak var DetailMenuExplanationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var minusView: UIView!
    @IBOutlet weak var numberOf: UILabel!
    @IBOutlet weak var shoppingBasket: UIButton!
    
    
    
    public var location: IndexPath?
    
    var productInfo: MenuModel?
    
//    var badgeNumber = 0
    
    let coreDataManager = CoreDataManager.shared
    
    let badgeManager = BadgeManager.shared
    
    let shoppingBasketButton = ShoppingBasketButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusView.layer.cornerRadius = plusView.frame.width / 2
        minusView.layer.cornerRadius = minusView.frame.width / 2
        numberOf.sizeToFit()
        
        updateUIFromMain()
        updateUIFromCategory()
        
        
        let concernPlusGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedPlus(_:)))
        plusView.addGestureRecognizer(concernPlusGesture)
        
        let concernMinusGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedMinus(_:)))
        minusView.addGestureRecognizer(concernMinusGesture)
        
        let concernDetailGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        DetailMenuImageView.isUserInteractionEnabled = true
        DetailMenuImageView.addGestureRecognizer(concernDetailGesture)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        //쇼핑카트버튼의 제약조건을 걸어줌 34, 44일떄만 가능하다고함(이유는 모름...)
//        NSLayoutConstraint.activate([
//            shoppingBasket.widthAnchor.constraint(equalToConstant: 34),
//            shoppingBasket.heightAnchor.constraint(equalToConstant: 44),
//        ])
       
        shoppingBasketButton.tintColor = .black
        let button = UIBarButtonItem(customView: shoppingBasketButton)
        self.navigationItem.rightBarButtonItem = button
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        coreDataManager.loadItem()
//        badgeManager.updateBadgeNumber()
//        badgeManager.badgeLabel(withCount: badgeManager.badgeNumber)
//        badgeManager.showBadge(withCount: badgeManager.badgeNumber, object: shoppingBasket)
    }

    var number = 1
    
    func makeDecimal(integer: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(from: NSNumber(value: integer)) else { return "" }
        return "\(String(describing: result))원"
    }
    
    @objc func tappedPlus(_ gesture: UITapGestureRecognizer) {
        number += 1
        if number > 20 {
            number = 20
        }
        
        numberOf.text = "\(number)"
        
        let intPrice = Int(priceLabel.text!)!
        let totalPirce = intPrice * number
        let strPrice = makeDecimal(integer: totalPirce)
        totalPrice.text = strPrice
    }
    
    @objc func tappedMinus(_ gesture: UITapGestureRecognizer) {
        number -= 1
        
        if number < 1 {
            number = 1
        }
        
        numberOf.text = "\(number)"
        
        let intPrice = Int(priceLabel.text!)
        let totalPirce = intPrice! * number
        let strPrice = makeDecimal(integer: totalPirce)
        totalPrice.text = strPrice
    }
    
    @objc func tappedImage(_ gesture: UITapGestureRecognizer) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailPopupView") as? GiftDetailPopupViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.location2 = location
        self.present(vc, animated: false)
        
    }
    
    func updateUIFromMain() {
        if let location = location {
            if location.section == 1 {
                DetailMenuImageView.image = RecommendMenu[location.row].image
                DetailMenuNameLabel.text = RecommendMenu[location.row].name
                DetailMenuExplanationLabel.text = RecommendMenu[location.row].explanation
                priceLabel.text = "\(RecommendMenu[location.row].price)"
            }
            if location.section == 3 {
                DetailMenuImageView.image = BestMenu[location.row].image
                DetailMenuNameLabel.text = BestMenu[location.row].name
                DetailMenuExplanationLabel.text = BestMenu[location.row].explanation
                priceLabel.text = "\(BestMenu[location.row].price)"
            }
            
        }
        
    }
    
    func updateUIFromCategory() {
        if let productInfo = productInfo {
            DetailMenuImageView.image = productInfo.image
            DetailMenuNameLabel.text = productInfo.name
            DetailMenuExplanationLabel.text = productInfo.explanation
            priceLabel.text = "\(productInfo.price)"
        }
    }

    
//    @IBAction func shoppingBasketClicked(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        //팝업뷰를 띄운후 장바구니로 이동버튼에 delegate지정
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "movePopupView") as? GiftMovePopupVC else { return }
        vc.modalPresentationStyle = .overFullScreen
//        vc.vcRef = self
        self.present(vc, animated: false)
        vc.PopupDelegate = self
       
        
        //MARK: - 담기버튼클릭시 코어데이터에 데이터를 저장
        // 1. 코어데이터에서 데이터 로드
        coreDataManager.loadItem()
        
        guard let name = DetailMenuNameLabel.text else { return }
        guard let price = priceLabel.text else { return }
        guard let number = numberOf.text else { return }

        for item in coreDataManager.itemArray {
            if item.name == name {

                let totalNumber = item.number + (Int32(number) ?? 0)
                // 수량
                item.setValue(totalNumber, forKey: "number")
                item.setValue((Int32(price) ?? 0) * totalNumber, forKey: "total")
                //CoreData에서 이름이같은 Item의 개수, 총계값을 변경해준다
            }
        }

        if coreDataManager.itemArray.contains(where: {$0.name == name}) == false {
            let newItem = Item(context: self.coreDataManager.context)

            //새로운 값을 코어데이터에 추가해준다
            newItem.name = name
            let stringPirce = price
            let intPrice = Int32(stringPirce)!
            newItem.price = intPrice

            let stringNumber = number
            let intNumber = Int32(stringNumber)!
            newItem.number = intNumber
            newItem.total = newItem.price * newItem.number
        }

        coreDataManager.saveItem()
        //loadItem은 GiftShoppingBasketVC이 load되면 함
        
    }
    
    //MARK: - Popup Delegate methods
    func goShoppingButtonClicked() {
        
        guard let ShoppingVC = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
        self.navigationController?.pushViewController(ShoppingVC, animated: true)
        
    }
    
}
