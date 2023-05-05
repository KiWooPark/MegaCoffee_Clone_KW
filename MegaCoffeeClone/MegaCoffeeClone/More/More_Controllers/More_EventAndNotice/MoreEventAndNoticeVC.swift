//
//  MoreEventAndNoticeVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/01.
//


import UIKit


// MARK: [Enum]
enum NewNotice {
    case event
    case notice
    case rankingEvent
}


class MoreEventAndNoticeVC: UIViewController {
    var newNotice = NewNotice.event
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoreEventAndRankingEventTVC.self, forCellReuseIdentifier: MoreEventAndRankingEventTVC.identifier)
        tableView.register(MoreNoticeTVC.self, forCellReuseIdentifier: MoreNoticeTVC.identifier)
        tableView.register(MoreEventAndRankingEventTVC.self, forCellReuseIdentifier: MoreEventAndRankingEventTVC.identifier)
        
        tableView.sectionHeaderTopPadding = 0
        
        
        return tableView
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MoreCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        layout()
    }
    
 
    
    
    
    
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {
        
        
        switch sender.tag {
            
        case 1: newNotice = .event
        case 2: newNotice = .notice
        case 3: newNotice = .rankingEvent
            
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

extension MoreEventAndNoticeVC: UITableViewDataSource {

    
    // HeaderView
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    // 백그라운드
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemBackground
    }
    
    
    
    
    
    
    // Custom Header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! MoreCustomHeaderView
        
        view.eventButton.setTitle("이벤트", for: .normal)
        view.noticeButton.setTitle("공지사항", for: .normal)
        view.rankingEventButton.setTitle("랭킹이벤트", for: .normal)

        
        
        view.eventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        view.noticeButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)

        view.rankingEventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
    
        
        return view
    }
    
    
    
    
    // height For Row At
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch newNotice {
            
        case .event: return 350
        case .notice: return 90
        case .rankingEvent: return 350
            
        }
        
    }
    
    
    // number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch newNotice {
            
        case .event: return eventModel.count
        case .notice: return noticeModel.count
        case .rankingEvent: return rankingEventModel.count
            
        }
  
    }
    
    // cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch newNotice {
        case .event:

            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: MoreEventAndRankingEventTVC.identifier, for: indexPath) as? MoreEventAndRankingEventTVC else { return UITableViewCell() }
            
            cell1.imgView = eventModel[indexPath.row].titleImgView
            cell1.titleLabel.text = eventModel[indexPath.row].titleLabel
            cell1.subTitleLabel.text = eventModel[indexPath.row].dateLabel
            
            return cell1
            
        case .notice:

            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: MoreNoticeTVC.identifier, for: indexPath) as! MoreNoticeTVC
            
            cell2.titleLabel.text = noticeModel[indexPath.row].titleLabel
            cell2.subTitleLabel.text = noticeModel[indexPath.row].dateLabel
            
            
            return cell2
           
            
        case .rankingEvent:
            
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreEventAndRankingEventTVC.identifier, for: indexPath) as? MoreEventAndRankingEventTVC else { return UITableViewCell() }
            
            
            cell3.imgView = rankingEventModel[indexPath.row].titleImgView
            cell3.titleLabel.text = rankingEventModel[indexPath.row].titleLabel
            cell3.subTitleLabel.text = rankingEventModel[indexPath.row].dateLabel
            
            
            
            return cell3
            
            
        }
        
    }
    
    
}



// MARK: [TableView - Delegate]
extension MoreEventAndNoticeVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch newNotice {
            
        case .event:
            let vc = MoreEventAndNoticeDetailVC()
            
            vc.titleLabel.text = eventModel[indexPath.row].titleLabel
            vc.dateLabel.text = eventModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        case .notice:
            let vc = MoreEventAndNoticeDetailVC()
            
            vc.titleLabel.text = noticeModel[indexPath.row].titleLabel
            vc.dateLabel.text = noticeModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        case .rankingEvent:
            let vc = MoreEventAndNoticeDetailVC()
            
            vc.titleLabel.text = rankingEventModel[indexPath.row].titleLabel
            vc.dateLabel.text = rankingEventModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
        }
        
    }
    
    
}








// MARK: [Layout]

extension MoreEventAndNoticeVC {
    
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
        
        
        self.navigationItem.title = "새소식"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
        
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
    }
    
    
    // TableView
    private func layoutTableView() {
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
