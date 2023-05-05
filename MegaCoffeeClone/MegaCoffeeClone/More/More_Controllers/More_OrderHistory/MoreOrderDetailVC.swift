//
//  MoreOrderDetailVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/30.
//

import Foundation
import UIKit


enum orderDetailList {
    case num1([OrderDetailModel])
    case num2([OrderDetailModel])
    case num3([OrderDetailModel])
    case num4([OrderDetailModel])
}



class MoreOrderDetailVC: UIViewController {
    var dataSource = [orderDetailList]()
    
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(OrderDetailTVC1.self, forCellReuseIdentifier: OrderDetailTVC1.identifier)
        tableView.register(OrderDetailTVC2.self, forCellReuseIdentifier: OrderDetailTVC2.identifier)
        tableView.register(OrderDetailTVC3.self, forCellReuseIdentifier: OrderDetailTVC3.identifier)
        tableView.register(OrderDetailTVC4.self, forCellReuseIdentifier: OrderDetailTVC4.identifier)
        
        

//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.sectionFooterHeight = 0

        
        return tableView
    }()
    
    
    
    
   
    
    
    // MARK: [1]

    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        sectionCell()
        
        layout()
    }
    
    
    
    
    
    // MARK: [Func]
    private func sectionCell() {
        let number1 = OrderDetailModel()
        let this1 = orderDetailList.num1([number1])
        
        let number2 = OrderDetailModel()
        let this2 = orderDetailList.num2([number2])
        
        let number3 = OrderDetailModel()
        let this3 = orderDetailList.num3([number3])
        
        let number4 = OrderDetailModel()
        let this4 = orderDetailList.num4([number4])
        
        
        
        self.dataSource = [
            this1, this2, this3, this4
        ]
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [TableView - DataSource]
extension MoreOrderDetailVC: UITableViewDataSource {
    
    
    // header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    // header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    
    // header background
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch self.dataSource[indexPath.section] {
            
        case .num1: return 300
        case .num2: return 130
        case .num3: return 170
        case .num4: return 80
            
        }
        
    }
    
    
    // number of [section]
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch self.dataSource[section] {
            
        case let .num1(num1s):
            return num1s.count
        case let .num2(num2s):
            return num2s.count
        case let .num3(num3s):
            return num3s.count
        case let .num4(num4s):
            return num4s.count
        }
        
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.dataSource[indexPath.section] {
            
        case .num1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: OrderDetailTVC1.identifier, for: indexPath) as! OrderDetailTVC1
            
            
            // 보류
            cell1.label1.text = week1Data[indexPath.row].storeLabel
            cell1.label2.text = week1Data[indexPath.row].orderNumberLabel
            cell1.label3.text = week1Data[indexPath.row].detailDateLabel
            
            
            
            
            return cell1
            
        case .num2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: OrderDetailTVC2.identifier, for: indexPath) as! OrderDetailTVC2
            
            
            
            
            
            
            
            return cell2
            
        case .num3:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: OrderDetailTVC3.identifier, for: indexPath) as! OrderDetailTVC3
            
            
            
            
            
            
            return cell3
            
        case .num4:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: OrderDetailTVC4.identifier, for: indexPath) as! OrderDetailTVC4
            
            
            
            
            
            return cell4
            
            
            
        }
    }
    
    
}








extension MoreOrderDetailVC: UITableViewDelegate {
    
}






// MARK: [Layout]
extension MoreOrderDetailVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutTableView()
        
    }
    
    // Navi Custom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "주문 내역"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
    
        
}

