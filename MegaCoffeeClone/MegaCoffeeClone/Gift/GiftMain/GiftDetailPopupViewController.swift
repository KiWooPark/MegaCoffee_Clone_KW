//
//  DetailPopupView.swift
//  MegaCoffeeClone
//
//  Created by 준연 on 2022/11/01.
//

import UIKit

class GiftDetailPopupViewController: ViewController {
    
    @IBOutlet weak var fullView: UIView!
    
    @IBOutlet weak var detailPopupView: UIView!
    
    @IBOutlet weak var standardLabel: UILabel!
    
    @IBOutlet weak var calorieLabel: UILabel!
    
    @IBOutlet weak var naLabel: UILabel!
    
    @IBOutlet weak var sugarLabel: UILabel!
    
    @IBOutlet weak var saturatedFatLabel: UILabel!
    
    @IBOutlet weak var proteinLabel: UILabel!
    
    @IBOutlet weak var caffeineLabel: UILabel!
    
    var location2: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailPopupView.clipsToBounds = true
        detailPopupView.layer.cornerRadius = 15
        
        let concernGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedFullView(_:)))
        fullView.addGestureRecognizer(concernGesture)
        updateUI()
    }
    
    @objc func tappedFullView(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: false)
    }
    
    func updateUI() {
        
        if let location2 = location2 {
            if location2.section == 1 {
                standardLabel.text = "\(RecommendMenu[location2.row].standard)(oz / g)기준"
                calorieLabel.text = RecommendMenu[location2.row].calorie
                naLabel.text = RecommendMenu[location2.row].Na
                sugarLabel.text = RecommendMenu[location2.row].sugar
                saturatedFatLabel.text = RecommendMenu[location2.row].saturatedFat
                proteinLabel.text = RecommendMenu[location2.row].protein
                caffeineLabel.text = RecommendMenu[location2.row].caffeine
            }
            if location2.section == 3 {
                standardLabel.text = "\(BestMenu[location2.row].standard)(oz / g)기준"
                calorieLabel.text = BestMenu[location2.row].calorie
                naLabel.text = BestMenu[location2.row].Na
                sugarLabel.text = BestMenu[location2.row].sugar
                saturatedFatLabel.text = BestMenu[location2.row].saturatedFat
                proteinLabel.text = BestMenu[location2.row].protein
                caffeineLabel.text = BestMenu[location2.row].caffeine
            }
        }
        
    }
    
}
