//
//  PermissionSettingViewController.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import UIKit

class MorePermissionSettingViewController: UIViewController {
    var permissionList = ["위치 정보 서비스 이용약관 동의","마케팅 활용 동의"]
    
    // MARK: [변수 선언]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
       
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        tableView.rowHeight = 60

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
extension MorePermissionSettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissionList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.selectionStyle = .none
        cell.textLabel?.text = permissionList[indexPath.row]
        
        
        
        
        //switch
        let switchView = UISwitch()
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        
        return cell
    }
    
    
    
    @objc func switchChanged(_ sender: UISwitch) {
        print(sender.tag)
        print(sender.isOn ? "ON" : "OFF")
    }
    
    
    
    @objc func setOnChangeButtonAction(_sender: Any) {
        
    }
    
    @objc func isOnChangeButtonAction(_sender: Any) {
        
    }
    
    
    
    
    
    
}

// MARK: [TableView - Delegate]
extension MorePermissionSettingViewController: UITableViewDelegate {

}








// MARK: [Layout]
extension MorePermissionSettingViewController {
    func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        layoutTableView()
    }
    
    
    // Navi Custom
    func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "권한 설정"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    
    // TableView
    @objc func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
    }
    
}

