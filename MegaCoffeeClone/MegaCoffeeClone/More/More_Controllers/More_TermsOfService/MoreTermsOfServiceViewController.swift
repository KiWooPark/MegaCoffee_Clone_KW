//
//  TermsOfServiceViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/21.
//

import UIKit

class MoreTermsOfServiceViewController: UIViewController {
    let vc = MoreDetailReadViewController()
    var menu = MoreTermsOfServiceDummyData.menu
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MoreTableViewCell.identifier)
        
        
        tableView.rowHeight = 60
        
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        return tableView
    }()
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        layout()
    }

    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [TableView - DataSource]
extension MoreTermsOfServiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier) else { return UITableViewCell(style: .default, reuseIdentifier: MoreTableViewCell.identifier)
            }
            return cell
        }()
        
        cell.selectionStyle = .none
        cell.textLabel?.text = MoreTermsOfServiceDummyData.menu[indexPath.row]
        cell.tintColor = UIColor.black
        cell.accessoryType = .disclosureIndicator
        
        let img = UIImageView(image: UIImage(systemName: "chevron.right"))
        img.tintColor = .black
        cell.accessoryView = img
        
        
    return cell
    }
}

// MARK: [TableView - Delegate]
extension MoreTermsOfServiceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        func moveDetailReadVC() {
            vc.navigationController?.navigationBar.topItem?.title = ""
            vc.navigationController?.navigationBar.tintColor = .black
            
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        

        switch MoreTermsOfServiceDummyData.menu[indexPath.row] {
        case "서비스 이용약관":
            vc.navigationItem.title = "서비스 이용약관"

            moveDetailReadVC()

        case "메가선불카드 이용약관":
            vc.navigationItem.title = "메가선불카드 이용약관"
            
            moveDetailReadVC()
            
        case "개인정보 처리방침":
            vc.navigationItem.title = "개인정보 처리방침"
            
            moveDetailReadVC()
            
        case "마케팅 활용 동의":
            vc.navigationItem.title = "마케팅 활용 동의"
            
            moveDetailReadVC()
            
        case "위치 기반 서비스 이용 동의":
            vc.navigationItem.title = "위치 기반 서비스 이용 동의"
            
            moveDetailReadVC()
            
        default:
            print("TermsOfServiceViewController - didSelectRowAt")
        }
        
        
    }
}









// MARK: [Layout]
extension MoreTermsOfServiceViewController {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        layoutTableView()
    }
    
    
    
    // NaviCustom
    private func naviCustom() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "이용약관"
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.backgroundColor = .systemBackground
       
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
    
}

