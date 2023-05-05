//
//  MoreViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/09/29.


import Foundation
import UIKit

class MoreViewController: UIViewController {
    var dummy = MoreMainModel.moreSectionHeader
    var giftCardURL = "https://event.multicon.co.kr/survey/megacoffee_b2b?pid=7Y6nRsuYxwbrGE%2BK13zbGQ%3D%3D&curr_time=1666352003&uid=7822996253187061"
    
    // MARK: [변수 선언] [0] : Frame
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()

    private lazy var contentView = UIView()
    
    
    
    // MARK: [변수 선언] [1] : Account & Service Button View
    private lazy var titleView = UIView()
  
    private lazy var accountSettingButton: UIButton = {
        let left = UIButton(type: .system)
        
        left.configuration?.buttonSize = .mini
        left.tintColor = .label
        left.setTitle("계정설정", for: .normal)
        left.translatesAutoresizingMaskIntoConstraints = false
        
        left.addTarget(self, action: #selector(moveToAccountSettingVC(sender:)), for: .touchUpInside)
        return left
    }()
    

    private lazy var centerLabel: UILabel = {
       let center = UILabel()
        
        center.text = "|"
        center.font = UIFont(name: center.font.fontName, size: 15)
        center.textColor = .systemGray
        center.translatesAutoresizingMaskIntoConstraints = false
        
        return center
    }()
    

    private lazy var ServiceCenterButton: UIButton = {
        let right = UIButton(type: .system)
        
        right.configuration?.buttonSize = .mini
        right.tintColor = .label
        right.setTitle("고객센터", for: .normal)
        right.translatesAutoresizingMaskIntoConstraints = false
        
        right.addTarget(self, action: #selector(moveToServieCenterVC(sender:)), for: .touchUpInside)
        return right
    }()
    

    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        stackView.addArrangedSubview(accountSettingButton)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(ServiceCenterButton)
        
        return stackView
    }()
    
    
    
    // MARK: [변수 선언] [2]: NickName View
    private lazy var titleSubView = UIView()
    
    private lazy var nicknameLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Mega 님"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
   
    
    
    
    // MARK: [변수 선언] [3]: List View
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MoreTableViewCell.identifier)
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        

    }
    
    
    
    
    
    
    // MARK: [Action]
    @objc func moveToAccountSettingVC(sender: UIButton) {
        let accountVC = MoreAccountSettingViewController()
        accountVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(accountVC, animated: false)
    }
    
    @objc func moveToServieCenterVC(sender: UIButton) {
        let serviceVC = MoreServiceCenterViewController()
        serviceVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(serviceVC, animated: false)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]





    

// MARK: [TableView - DataSource]
extension MoreViewController: UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummy.count
      }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dummy[section]
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
        header.textLabel?.textColor = .black
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return MoreMainModel.sectionList1.count
        } else if section == 1 {
            return MoreMainModel.sectionList2.count
        } else if section == 2 {
            return MoreMainModel.sectionList3.count
        } else if section == 3 {
            return MoreMainModel.sectionList4.count
        } else {
            return 0
        }
    }
    

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier) else { return UITableViewCell(style: .default, reuseIdentifier: MoreTableViewCell.identifier)
            }
            return cell
        }()
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList1[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList2[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList3[indexPath.row])"
        } else if indexPath.section == 3 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList4[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
}




// MARK: [TableView - Delegate]
extension MoreViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
            
        // 멤버쉽
        case 0:
            if MoreMainModel.sectionList1[indexPath.row] == "스탬프" {
                
                
                let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "HomeStampViewController") as? HomeStampViewController else { return }
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else {
                
                let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "HomeCouponViewController") as? HomeCouponViewController else { return }
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            }
            
            
        // 주문
        case 1:
            if MoreMainModel.sectionList2[indexPath.row] == "메가 오더" {
                self.tabBarController?.selectedIndex = 1
            }
            
            
            else if MoreMainModel.sectionList2[indexPath.row] == "주문 내역" {
                let vc = MoreOrderHistroyVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "선물하기" {
                self.tabBarController?.selectedIndex = 2
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "메가선불카드" {
                alertOK(message: "준비중입니다")
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "간편카드 관리" {
                let vc = MoreSimpleCardVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "상품권 대량 구매 신청" {
                if let url = URL(string: giftCardURL) {
                    UIApplication.shared.open(url, options: [:])
                    
                }
            }
            
            // 새소식
        case 2:
            if MoreMainModel.sectionList3[indexPath.row] == "이벤트" {
                print("이벤트")
                let vc = MoreEventAndNoticeVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                print("공지사항")
                let vc = MoreEventAndNoticeVC()
                
                vc.hidesBottomBarWhenPushed = true
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
            // 약관 및 정책
        case 3:
            let vc = MoreTermsOfServiceViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        default: print("MoreViewController - didSelectRowAt")
        }
        
    }
}










// MARK: [Layout]
extension MoreViewController {
    
    private func layout() {
        
        number0LayoutFrame()
        number1Layout1AccountAndServiceButton()
        number2LayoutNickName()
        number3LayoutListView()
       
    }
    
    
    
    
    
    private func number0LayoutFrame() {
        
        self.view.backgroundColor = .systemBackground
        layoutScrollView()
        layoutContentView()
    }
    
    private func number1Layout1AccountAndServiceButton() {
        layoutTitleView()
        layoutStackView()
    }
    
    private func number2LayoutNickName() {
        layoutTitleSubView()
        layoutNicknameLabel()
    }

    private func number3LayoutListView() {
        layoutTableView()
    }
    
    
    
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // ContentView
    private func layoutContentView() {
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 870)
        ])
    }
    
    // TitleView
    private func layoutTitleView() {
        self.contentView.addSubview(self.titleView)
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    

    // StackView
    private func layoutStackView() {
        self.titleView.addSubview(self.topStackView)
        
        self.topStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topStackView.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor),
            self.topStackView.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5)
        ])
    }
    
    // TitleSubView
    private func layoutTitleSubView() {
        self.contentView.addSubview(self.titleSubView)
        
        self.titleSubView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleSubView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.titleSubView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.titleSubView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleSubView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // NicknameLabel
    private func layoutNicknameLabel() {
        self.titleSubView.addSubview(self.nicknameLabel)
        
        self.nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameLabel.leadingAnchor.constraint(equalTo: self.titleSubView.leadingAnchor),
            self.nicknameLabel.bottomAnchor.constraint(equalTo: self.titleSubView.bottomAnchor)
        ])
    }

    
    // TableView
    private func layoutTableView() {
        self.contentView.addSubview(self.tableView)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.titleSubView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
    }
    

    
    
}


