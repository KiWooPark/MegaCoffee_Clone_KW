//
//  Extension-ColorSet.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/06.
//

import Foundation
import UIKit

extension UIColor {
    static var done = { return UIColor(named: "done") }
    static var close = { return UIColor(named: "close") }
    
    // 11월 2일 수요일 김성호 추가.
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
