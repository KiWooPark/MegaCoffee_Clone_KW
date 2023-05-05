//
//  OrderStoreDummyData.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2023/03/30.
//

import Foundation
import UIKit

struct StoreModel {
    let name: String
    let address: String
    let distance: Int
    var bookMark: Bool
    let isOn: Bool
    let storeImage: UIImage
}

extension StoreModel {
    static var storeDatas = [
        StoreModel(name: "평택장당점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 24, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "서정리역점", address: "경기도 평택시 정암로 3", distance: 652, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "평택고덕로데오점", address: "경기도 평택시 고덕갈평5길 30, 1동 1층 101호(고덕동, 서정타워1차)", distance: 975, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "고덕메디컬센터점", address: "경기도 평택시 고덕중앙로 218,111호(고덕동,우성메디컬센터)", distance: 1160, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "평택이충점", address: "경기도 평택시 이충로35번길 26, 103호(이충동)", distance: 1170, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "평택고덕삼성점", address: "경기도 평택시 고덕면 고덕여염 12길 84", distance: 1220, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "고덕삼성전자사거리점", address: "경기도 평택시 고덕여염9길 22, 107호(고덕동, 고덕 헤리움 비즈타워 2차)", distance: 1560, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
        StoreModel(name: "송탄출장소점", address: "경기도 평택시 서정동 874-1 102호", distance: 1690, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage())]
    
    static var likeStoreDatas = [StoreModel]()
}



