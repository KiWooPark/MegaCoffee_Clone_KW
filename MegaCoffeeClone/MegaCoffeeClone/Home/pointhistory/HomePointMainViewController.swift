//
//  HomePointHistoryViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/18.
//

import UIKit

class HomePointMainViewController: UIViewController {
    
    @IBOutlet weak var switchView: UISegmentedControl!
    
    @IBOutlet weak var firstView: UIView! //노란색
    
    @IBOutlet weak var secondView: UIView! // 초록색
    @IBOutlet weak var thirdView: UIView!//하늘색
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var stampTable: UITableView!
    
    
    struct homeStamp {
        
        var history: String
        var during: String
        var number : String
        
    }
    
    let data: [homeStamp] = [
        homeStamp(history: "", during: "", number: ""),
        homeStamp(history: "", during: "", number: ""),
        homeStamp(history: "", during: "", number: ""),
        homeStamp(history: "", during: "", number: "")
    ]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
            
        }
        if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
            fourthView.alpha = 0
            
        }
        if sender.selectedSegmentIndex == 2 {
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
            fourthView.alpha = 0
            
        }
        if sender.selectedSegmentIndex == 3 {
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 1
            
        }
        
        
        
    }
    //    private func setup() {
    //
    //        addChild(pointhistoryVC)
    //        addChild(OneMonthVC)
    //        addChild(ThirdVC)
    //        addChild(periodVC)
    //        self.view.addSubview(pointhistoryVC.view)
    //        self.view.addSubview(OneMonthVC.view)
    //        self.view.addSubview(ThirdVC.view)
    //        self.view.addSubview(periodVC.view)
    //
    //        pointhistoryVC.didMove(toParent: self)
    //        OneMonthVC.didMove(toParent: self)
    //        ThirdVC.didMove(toParent: self)
    //        periodVC.didMove(toParent: self)
    //
    //        pointhistoryVC.view.frame = self.view.bounds
    //        OneMonthVC.view.frame = self.view.bounds
    //        ThirdVC.view.frame = self.view.bounds
    //        periodVC.view.frame = self.view.bounds
    //
    //
    //    }
    //
    //    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
    //        pointhistoryVC.view.isHidden = true
    //        OneMonthVC.view.isHidden = true
    //        ThirdVC.view.isHidden = true
    //        periodVC.view.isHidden = true
    //
    //
    //        if sender.selectedSegmentIndex == 0{
    //            view.backgroundColor = .blue
    //            pointhistoryVC.view.isHidden = false
    //
    //
    //        } else if sender.selectedSegmentIndex == 1 {
    //            view.backgroundColor = .red
    //            OneMonthVC.view.isHidden = false
    //
    //
    //        }
    //        else if sender.selectedSegmentIndex == 2 {
    //            view.backgroundColor = .white
    //            ThirdVC.view.isHidden = false
    //
    //        }
    //        else if sender.selectedSegmentIndex == 3 {
    //            view.backgroundColor = .yellow
    //            periodVC.view.isHidden = false
    //
    //        }
    //    }
    
    
    
}

