//
//  GiftViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/12.
//https://ios-development.tistory.com/945 (Section > Group > Item)


import UIKit

class GiftViewController: ViewController {
    
    @IBOutlet weak var contentsView: UIView!
    
    
    @IBOutlet weak var shoppingBasket: UIButton!
    
    
    
    var mainView: UIView!
    
    var categoryView: UIView!
    
    var giftboxView: UIView!
    
    @IBOutlet weak var findButton: UIBarButtonItem!
    
    
    
    @IBOutlet weak var segmentedControl: UnderlineSegmentedControl!
    
    let coreDataManager = CoreDataManager.shared
    let badgeManager = BadgeManager.shared
    
    let shoppingBasketButton = ShoppingBasketButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 18, weight: .bold)
            ],
            for: .selected
        )
        self.segmentedControl.selectedSegmentIndex = 0
        
        changeViewControllers()
        hideFindButton()
        
        shoppingBasketButton.tintColor = .black
        let button = UIBarButtonItem(customView: shoppingBasketButton)
        self.navigationItem.rightBarButtonItems?.insert(button, at: 0)
        
//        NSLayoutConstraint.activate([
//            shoppingBasket.widthAnchor.constraint(equalToConstant: 34),
//            shoppingBasket.heightAnchor.constraint(equalToConstant: 44),
//        ])
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coreDataManager.loadItem()
//        badgeManager.updateBadgeNumber()
//        badgeManager.badgeLabel(withCount: badgeManager.badgeNumber)
//        badgeManager.showBadge(withCount: badgeManager.badgeNumber, object: shoppingBasket)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
      
    }
    
    
    func changeViewControllers() {
        guard  let mainVC =  self.storyboard?.instantiateViewController(identifier: "mainVC"),
               let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "categoryVC"),
               let giftboxVC = self.storyboard?.instantiateViewController(withIdentifier: "giftboxVC")
        else { fatalError() }
        
        self.addChild(mainVC)
        self.addChild(categoryVC)
        self.addChild(giftboxVC)

        self.contentsView.addSubview(mainVC.view)
//        mainVC.didMove(toParent: self)
        
       
        
        self.mainView = mainVC.view
        self.categoryView = categoryVC.view
        self.giftboxView = giftboxVC.view
        
    }
    
    
    @IBAction func segmentControlClicked(_ sender: UnderlineSegmentedControl) {
        
        if sender.selectedSegmentIndex == 0  {
            self.contentsView.addSubview(mainView)
            categoryView.removeFromSuperview()
            giftboxView.removeFromSuperview()
            hideFindButton()

            
        } else if sender.selectedSegmentIndex == 1 {
            self.contentsView.addSubview(categoryView)
            
            categoryView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                           categoryView.topAnchor.constraint(equalTo: contentsView.topAnchor),
                           categoryView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor),
                           categoryView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
                           categoryView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor)
                       ])
            
            mainView.removeFromSuperview()
            giftboxView.removeFromSuperview()
            findButton.isEnabled = true
            findButton.tintColor = UIColor.black

        }else {
            self.contentsView.addSubview(giftboxView)
            mainView.removeFromSuperview()
            categoryView.removeFromSuperview()
            hideFindButton()

        }
    }
    
    func hideFindButton() {
        findButton.isEnabled = false
        findButton.tintColor = UIColor.clear
    }
    
    
    @IBAction func exclamationmarkClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopUPView") as? GiftPopUpViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    @IBAction func findButtonClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductSearch") as? GiftProductSearchVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func shoppingBasketClicked(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


