//
//  GiftCartBadgeManager.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/24.
//
//https://nemecek.be/blog/17/how-to-add-badge-to-uibarbuttonitem (barButtonItem에 뱃지 추가하는방법)
import UIKit

final class BadgeManager {
    static let shared = BadgeManager()
    
    let coreDataManager = CoreDataManager.shared
    
    var badgeNumber = 0
    let badgeSize: CGFloat = 20
    let badgeTag = 9830384
    
    private init() { }
    //아래 제약이 viewdidload에 있어야함
//    NSLayoutConstraint.activate([
//        notificationsButton.widthAnchor.constraint(equalToConstant: 34),
//        notificationsButton.heightAnchor.constraint(equalToConstant: 44),
//    ])
    
    func updateBadgeNumber() {
        //badgenumber를 바로 사용하면 중첩되어 끝없이 커짐
        //numebr라는 변수를 만들어 매번 초기화 시켜주고 badgenumber에 담아준다
        var number = 0
        for item in coreDataManager.itemArray {
            number += Int(item.number)
        }
        badgeNumber = number
    }
    
    func badgeLabel(withCount count: Int) -> UILabel {
        let badgeCount = UILabel(frame: CGRect(x: 0, y: 0, width: badgeSize, height: badgeSize))
        badgeCount.translatesAutoresizingMaskIntoConstraints = false
        badgeCount.tag = badgeTag
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .systemRed
        badgeCount.text = String(count)
        
        return badgeCount
    }
    
    func showBadge(withCount count: Int, object: UIButton) {
        let badge = badgeLabel(withCount: count)
        object.addSubview(badge)

        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: object.leftAnchor, constant: 14),
            badge.topAnchor.constraint(equalTo: object.topAnchor, constant: 4),
            badge.widthAnchor.constraint(equalToConstant: badgeSize),
            badge.heightAnchor.constraint(equalToConstant: badgeSize)
        ])
    }
}
