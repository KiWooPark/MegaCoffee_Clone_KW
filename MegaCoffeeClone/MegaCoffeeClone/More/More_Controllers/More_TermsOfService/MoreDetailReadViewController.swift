//
//  DetailReadViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/22.
//

import UIKit

class MoreDetailReadViewController: UIViewController {

    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MoreTableViewCell.identifier)
        
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        tableView.separatorStyle = .none

        return tableView
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    
    

    
// MARK: [Class End]
    
}

// MARK: [Class End]












// MARK: [TableView - DataSource]
extension MoreDetailReadViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier) else { return UITableViewCell(style: .default, reuseIdentifier: MoreTableViewCell.identifier)
            }
            return cell
        }()

        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        switch self.navigationItem.title {
        case "서비스 이용약관":
            cell.textLabel?.text = MoreTermsOfServiceDummyData.termsOfServiceData
        case "메가선불카드 이용약관":
            cell.textLabel?.text = MoreTermsOfServiceDummyData.termsOfMegaCardData
        case "개인정보 처리방침":
            cell.textLabel?.text = MoreTermsOfServiceDummyData.privacyPolicy
        case "마케팅 활용 동의":
            cell.textLabel?.text = MoreTermsOfServiceDummyData.consentToUseForMarketing
        case "위치 기반 서비스 이용 동의":
            cell.textLabel?.text = MoreTermsOfServiceDummyData.consentToUseOfLocationBasedServices
        default:
            print("DetailReadViewController - didSelectRowAt")
        }
        
        return cell
        
    }
}







// MARK: [Layout]
extension MoreDetailReadViewController {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        layoutTableView()
    }
    
    // NaviCustom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

