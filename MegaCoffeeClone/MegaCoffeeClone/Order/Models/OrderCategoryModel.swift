//
//  CategoryModel.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2023/03/31.
//

import Foundation
import UIKit

struct CategoryModel {
    let name: String
    var isSelected: Bool
}

enum SelectedCategory {
    case list
    case map
    case like
}

extension CategoryModel {
    static var categorys = [
        CategoryModel(name: "세트메뉴", isSelected: false),
        CategoryModel(name: "신메뉴", isSelected: false),
        CategoryModel(name: "커피(HOT)", isSelected: false),
        CategoryModel(name: "커피(ICE)", isSelected: false),
        CategoryModel(name: "디카페인", isSelected: false),
        CategoryModel(name: "스무디&프라페", isSelected: false),
        CategoryModel(name: "에이드&주스", isSelected: false),
        CategoryModel(name: "병음료", isSelected: false),
        CategoryModel(name: "Tea", isSelected: false),
        CategoryModel(name: "커피(콜드브루)", isSelected: false),
        CategoryModel(name: "BEVERAGE", isSelected: false),
        CategoryModel(name: "디저트", isSelected: false),
        CategoryModel(name: "MD상품", isSelected: false)]
}
