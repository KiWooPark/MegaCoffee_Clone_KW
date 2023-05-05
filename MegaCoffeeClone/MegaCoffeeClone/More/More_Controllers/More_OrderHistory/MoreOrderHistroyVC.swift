//
//  MoreOrderHistroyVC.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/18.
//

import Foundation
import UIKit


// MARK: [Enum]
enum History {
    case week1
    case month1
    case month3
    case total
}


class MoreOrderHistroyVC: UIViewController {
    var history = History.week1
    let headerView = MoreOrderCustomHeaderView()
    
    
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoreWeek1TVC.self, forCellReuseIdentifier: MoreWeek1TVC.identifier)
        tableView.register(MoreMonth1TVC.self, forCellReuseIdentifier: MoreMonth1TVC.identifier)
        tableView.register(MoreMonth3TVC.self, forCellReuseIdentifier: MoreMonth3TVC.identifier)
        tableView.register(MoreTotalTVC.self, forCellReuseIdentifier: MoreTotalTVC.identifier)
        
        tableView.rowHeight = 100
        
        return tableView
    }()
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        tableView.register(MoreOrderCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "OrderCustomHeaderView")
        
        
        layout()
    }
    
   
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {

        
        switch sender.tag {
            
        case 1: history = .week1
        case 2: history = .month1
        case 3: history = .month3
        case 4: history = .total

        default: break
            
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
     
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]







// MARK: [TableView - DataSource]
extension MoreOrderHistroyVC: UITableViewDataSource {
    
 

    // HeaderView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
    }
    
    
    // HeaderView Setting
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let hed = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderCustomHeaderView") as! MoreOrderCustomHeaderView
        
        hed.week1Button.setTitle("1주일", for: .normal)
        hed.month1Button.setTitle("1개월", for: .normal)
        hed.month3Button.setTitle("3개월", for: .normal)
        hed.totalButton.setTitle("전체", for: .normal)
        
      
        
       
        
        hed.week1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        hed.month1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)

        hed.month3Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        hed.totalButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        
    
        return hed
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch history {
            
        case .week1: return week1Data.count
        case .month1: return 2
        case .month3: return 3
        case .total: return 4
            
        }
  
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch history {
            
        case .week1:

            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: MoreWeek1TVC.identifier, for: indexPath) as? MoreWeek1TVC else { return UITableViewCell() }
            
            
            
            cell1.stateLabel.text = week1Data[indexPath.row].stateLabel
            cell1.storeLabel.text = week1Data[indexPath.row].storeLabel
            cell1.menuLabel.text = week1Data[indexPath.row].menuLabel
            cell1.menuCountLabel.text = week1Data[indexPath.row].menuCountLabel
            cell1.centerLabel.text = "|"
            cell1.dateLabel.text = week1Data[indexPath.row].dateLabel

            
            return cell1
            
            
            
        case .month1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: MoreMonth1TVC.identifier, for: indexPath) as! MoreMonth1TVC
            
            //
            
            return cell2
           
            
            
            
        case .month3:
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreMonth3TVC.identifier, for: indexPath) as? MoreMonth3TVC else { return UITableViewCell() }
            
           
            //
            
            return cell3
            
        case .total:
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreTotalTVC.identifier, for: indexPath) as? MoreTotalTVC else { return UITableViewCell() }
            
         
            //
            
            return cell3
            
            
        }
        
    }
    
    
    
    
}




// MARK: [TableView - Delegate]
extension MoreOrderHistroyVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch history {
            
            
        case .week1:
            let vc = MoreOrderDetailVC()
            self.navigationController?.pushViewController(vc, animated: false)
            
            
        case .month1: print("")
        case .month3: print("")
        case .total: print("")
            
            
        }
        
    }
    
    
}




// MARK: [Layout]
extension MoreOrderHistroyVC {
    
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
       
        
        self.navigationItem.title = "주문내역"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
