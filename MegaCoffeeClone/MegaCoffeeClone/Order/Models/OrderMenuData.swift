//
//  DummyDatas.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
// 123

import Foundation
import UIKit

// MARK: 상품 데이터 모델
enum MenuType2: String {
    case set = "세트메뉴"
    case new = "신메뉴"
    case hot = "커피(HOT)"
    case ice = "커피(ICE)"
    case smoothieAndFrappe = "스무디&프라페"
    case aidAndJuice = "에이드&주스"
    case arSonMenu = "AR손흥민 메뉴"
    case bottle = "병음료"
    case tea = "Tea"
    case coldBrew = "커피(콜드브루)"
    case decaffeination = "디카페인"
    case beverage = "BEVERAGE"
    case dessert = "디저트"
    case md = "MD상품"
}

struct RecommendMenuModel {
    let image: UIImage
    let name: String
    let price: Int
    var isSelect: Bool
}

//Gift- 상품검색 페이지 모델
struct GiftSearchProductModel {
    let type: String
    let products: SimpleMenuModel
}

struct SimpleMenuModel {
    let image: UIImage
    let name: String
    let price: Int
}

struct GiftCategoryModel {
    let categoryName: String
    var isClicked: Bool
}

struct Menu1: Codable {
    let type: String?
    var menus: [MenuModel1]
    
    struct MenuModel1: Codable {
        var category: String?
        let isGift: Bool?
        let image: String?
        let name: String?
        let description: String?
        var option: [OptionModel1]?
        let nutrition: NutritionModel1?
        let allergys: [String]?
        let price: Int?
        let soldOut: Bool?
        
        struct OptionModel1: Codable {
            let essentialCount: Int?
            let header: String?
            var details: [DetailModel1]?
        
            struct DetailModel1: Codable {
                let name: String?
                let price: Int?
                var count: Int?
                let soldOut: Bool?
                var isSelect: Bool?
            }
        }
        
        struct NutritionModel1: Codable {
            let calorie: Float?
            let saturatedFat: Float?
            let sugars: Float?
            let natrium: Float?
            let protein: Float?
            let caffeine: Float?
        }
    }
    
    static func fetchMenuData() -> [Menu1] {
        guard let path = Bundle.main.path(forResource: "MenuData", ofType: "json") else { return [] }
        
        guard let jsonString = try? String(contentsOfFile: path) else { return [] }
        
        guard let data = jsonString.data(using: .utf8) else { return [] }
        
        let decoder = JSONDecoder()
        
        do {
            let menuData = try decoder.decode([Menu1].self, from: data)
 
            return menuData
        } catch {
            print(error)
            return []
        }
    }
}

struct SearchProductsModel: Codable {
    
}

struct ShoppingBasketModel: Codable {
    let productName: String
    let productImage: String
    var options: [String]
    var count: Int
    let price: Int
    var totalPrice: Int
}

struct RecomendMenuModel: Codable {
    var image: String?
    var name: String?
    var price: Int?
    var isSelect: Bool?
    
    static func fetchMenuData() -> [RecomendMenuModel] {
        guard let path = Bundle.main.path(forResource: "recomendMenus", ofType: "json") else { return [] }
        
        guard let jsonString = try? String(contentsOfFile: path) else { return [] }
        
        guard let data = jsonString.data(using: .utf8) else { return [] }
        
        let decoder = JSONDecoder()
        
        do {
            var menuData = try decoder.decode([RecomendMenuModel].self, from: data)
            
            for (index, _) in menuData.enumerated() {
                menuData[index].isSelect = false
            }
            
            return menuData
        } catch {
            print(error)
            return []
        }
    }
}

