//
//  RecommenMenuData.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/18.
//
//
import Foundation
import UIKit

struct MenuModel {
    let name: String
    let price: Int
    let image: UIImage
    let explanation: String
    let standard: String
    let calorie: String
    let Na: String
    let sugar: String
    let saturatedFat: String
    let protein: String
    let caffeine: String
}

enum MenuType: Int {
    case set = 0
    case newAndBest = 1
    case coffee = 2
    case decaffeine = 3
    case smoothieAndFrappe = 4
    case aidAndJuice = 5
    case beverage = 6
    case tea = 7
    case espresso = 8
    case desert = 9
    case md = 10
    case giftcard = 11
}

struct MenuModels {
    let type: MenuType
    let products: [MenuModel]
}



var mainImages = [UIImage(named: "Image1") ,UIImage(named: "Image2")]

var RecommendMenu = [
MenuModel(name: "마녀의비밀티플레저", price: 4400, image: UIImage(named: "마녀의비밀티플레저") ?? UIImage(), explanation: "푸루티 베이스와 라벤더 티백이 어우러져 만든 달콤한 맛과 탄산캔디의 톡톡 터지는 재미로, 즐거움을 전하는 마법 같은 음료", standard: "24oz", calorie: "244.7kcal", Na: "21.4mg", sugar: "35.1g", saturatedFat: "0.2g", protein: "0.8g", caffeine: "0.0mg" ),

MenuModel(name: "밀크몬스터도넛", price: 3300, image: UIImage(named: "밀크몬스터도넛") ?? UIImage(), explanation: "폭신한 빵 사이에 부드러운 우유크림을 듬뿍 채워낸 크림 샌드 도넛", standard: "82g", calorie: "371.2kcal", Na: "181.7mg", sugar: "16.2g", saturatedFat: "17.7g", protein: "3.0g", caffeine: "0.0g"  ),

MenuModel(name: "청도홍시스무디", price: 4400, image: UIImage(named: "청도홍시스무디") ?? UIImage(), explanation: "부드러운 청도 홍시를 듬~뿍 담은 스무디", standard: "20oz", calorie: "194.7kcal", Na: "10.3g", sugar: "32.1g", saturatedFat: "0.0g", protein: "0.8g", caffeine: "0.0g"  ),

MenuModel(name: "(ICE)청도홍시수정과티플레저", price: 3900, image: UIImage(named: "(ICE)청도홍시수정과티플레저") ?? UIImage(), explanation: "청도 홍시에 메가MGC커피 시그니처 수정과 티백을 사용한 가을 시즌 한정 티 블랜딩 음료", standard: "24oz", calorie: "153.2kcal", Na: "15.4g", sugar: "20.3g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0g"  ),

MenuModel(name: "(HOT)청도홍시수정과티플레저", price: 3900, image: UIImage(named: "(HOT)청도홍시수정과티플레저") ?? UIImage(), explanation: "청도 홍시에 메가MGC커피 시그니처 수정과 티백을 사용한 가을 시즌 한정 티 블랜딩 음료", standard: "20oz", calorie: "148kcal", Na: "14.5g", sugar: "25.4g", saturatedFat: "0.0g", protein: "0.4g", caffeine: "0.0g"  ),

MenuModel(name: "그릭요거홍시놀라", price: 4400, image: UIImage(named: "그릭요거홍시놀라") ?? UIImage(), explanation: "청도 홍시와 새콤한 그릭요거트 그리고 건강한 그래놀라가 만나 든든하게 즐기는 한 끼 메뉴", standard: "14oz", calorie: "399.8kcal", Na: "92.5g", sugar: "40.7gg", saturatedFat: "2.5g", protein: "0.0g", caffeine: "0.0g"  ),

MenuModel(name: "경산대추과즐", price: 1900, image: UIImage(named: "경산대추과즐") ?? UIImage(), explanation: "경산 대추와 우리 밀을 넣은 달콤 쫀득한 피에 국내산 조청과 쌀 튀밥을 입혀 바삭하게 구운 한과", standard: "28g", calorie: "116kcal", Na: "27g", sugar: "5g", saturatedFat: "1.3g", protein: "2g", caffeine: "0g"  ),

MenuModel(name: "마르게리타피자", price: 5400, image: UIImage(named: "마르게리타피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 토마토소스, 모짜렐라 치즈 바질을 더해 든든하게 만든 풍미가득 마르게리타 피자", standard: "140g", calorie: "360kcal", Na: "630g", sugar: "8g", saturatedFat: "4.5g", protein: "14g", caffeine: "0.0g" ),

MenuModel(name: "허니버터피자", price: 5100, image: UIImage(named: "허니버터피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 버터, 모짜렐라 치즈, 꿀을 더해 든든하게 만든 단짠단짠 허니버터 피자", standard: "145g", calorie: "500kcal", Na: "650g", sugar: "9g", saturatedFat: "14g", protein: "19g", caffeine: "0.0g" ),

MenuModel(name: "에스프레소 도피오", price: 2000, image: UIImage(named: "에스프레소 도피오") ?? UIImage(), explanation: "더블샷으로 더욱 진하게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "15.2kcal", Na: "0.4mg", sugar: "0.0g", saturatedFat: "0.1g", protein: "1.0mg", caffeine: "184.7mg"  ),

MenuModel(name: "에스프레소 피에노", price: 2400, image: UIImage(named: "에스프레소 피에노") ?? UIImage(), explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"  ),

MenuModel(name: "에스프레소", price: 1500, image: UIImage(named: "에스프레소") ?? UIImage(), explanation: "메가MGC커피 원두의 향미를 온전히 즐길 수 있는 에스프레소", standard: "2oz", calorie: "7.6kcal", Na: "0.2g", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.5g", caffeine: "104.8mg" ),

MenuModel(name: "젤라또 아포가토", price: 3200, image: UIImage(named: "젤라또 아포가토") ?? UIImage(), explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg"  )
]


var MegaCardMenu = [
MenuModel(name: "1만원 상품권", price: 10000, image: UIImage(named: "1만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

MenuModel(name: "2만원 상품권", price: 20000, image: UIImage(named: "2만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

MenuModel(name: "3만원 상품권", price: 30000, image: UIImage(named: "3만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

MenuModel(name: "5만원 상품권", price: 50000, image: UIImage(named: "3만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" )
]


var BestMenu = [
    MenuModel(name: "경산대추과즐", price: 1900, image: UIImage(named: "경산대추과즐") ?? UIImage(), explanation: "경산 대추와 우리 밀을 넣은 달콤 쫀득한 피에 국내산 조청과 쌀 튀밥을 입혀 바삭하게 구운 한과", standard: "28g", calorie: "116kcal", Na: "27g", sugar: "5g", saturatedFat: "1.3g", protein: "2g", caffeine: "0g"),

    MenuModel(name: "허니버터피자", price: 5100, image: UIImage(named: "허니버터피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 버터, 모짜렐라 치즈, 꿀을 더해 든든하게 만든 단짠단짠 허니버터 피자", standard: "145g", calorie: "500kcal", Na: "650g", sugar: "9g", saturatedFat: "14g", protein: "19g", caffeine: "0.0g" ),

    MenuModel(name: "마르게리타피자", price: 5400, image: UIImage(named: "마르게리타피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 토마토소스, 모짜렐라 치즈 바질을 더해 든든하게 만든 풍미가득 마르게리타 피자", standard: "140g", calorie: "360kcal", Na: "630g", sugar: "8g", saturatedFat: "4.5g", protein: "14g", caffeine: "0.0g" ),

    MenuModel(name: "스테비아 케이스", price: 5900, image: UIImage(named: "스테비아 케이스") ?? UIImage(), explanation: "천연 감미료 스테비아 1gx40개입 케이스.", standard: "1g X 40ea", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""  ),

    MenuModel(name: "에스프레소 피에노", price: 2400, image: UIImage(named: "에스프레소 피에노") ?? UIImage(), explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"  ),

    MenuModel(name: "젤라또 아포가토", price: 3200, image: UIImage(named: "젤라또 아포가토") ?? UIImage(), explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg"  ),

    MenuModel(name: "(HOT)아메리카노", price: 1500, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "20oz", calorie: "12.2kcal", Na: "2.4mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.0g", caffeine: "204.2mg"  ),

    MenuModel(name: "(ICE)메가초코", price: 3800, image: UIImage(named: "(ICE)메가초코") ?? UIImage(), explanation: "부드러운 우유에 진한 초코소스, 달콤한 휘핑크림의 삼박자 조화로 완성한 달콤 초코 음료.", standard: "20oz", calorie: "507.0kcal", Na: "218.0mg", sugar: "31.3g", saturatedFat: "12.0g", protein: "11.9g", caffeine: "51.8mg" ),

    MenuModel(name: "(ICE)아메리카노", price: 2000, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

    MenuModel(name: "메가에이드", price: 3900, image: UIImage(named: "메가에이드") ?? UIImage(), explanation: "상큼한 레몬, 상쾌한 라임, 달콤쌉싸름한 자몽의 3색 맛을 한데 어우른 메가MGC커피 시그니처 에이드.", standard: "24oz", calorie: "292.4kcal", Na: "9.1mg", sugar: "53.9g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0mg" ),

    MenuModel(name: "유니콘프라페", price: 4800, image: UIImage(named: "유니콘프라페") ?? UIImage(), explanation: "다채로운 비주얼로 보는 즐거움을 채우고, 달콤함과 상큼함 색깔마다 달라지는 유쾌한 맛까지 잡은 이색프라페.", standard: "20oz", calorie: "474.5kcal", Na: "141.2mg", sugar: "42.3g", saturatedFat: "11.1g", protein: "7.0g", caffeine: "0.0mg" ),

    MenuModel(name: "유니콘프라페마카롱", price: 2100, image: UIImage(named: "유니콘프라페마카롱") ?? UIImage(), explanation: "메가커피 인기 음료인 유니콘 프라페를 모티브로 만든 매지컬 비주얼 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

    MenuModel(name: "쿠키프라페", price: 3900, image: UIImage(named: "쿠키프라페") ?? UIImage(), explanation: "바삭하고 달콤한 오레오와 고소한 우유, 부드러운 바닐라향의 조화를 느낄 수 있는 프라페.", standard: "20oz", calorie: "640.7kcal", Na: "332.5mg", sugar: "39.4g", saturatedFat: "16.9g", protein: "9.8g", caffeine: "5.5mg" ),

    MenuModel(name: "쿠키프라페마카롱", price: 2100, image: UIImage(named: "쿠키프라페마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 쿠키프라페를 모티브로 만든 달콤한 마카롱.", standard: "50g", calorie: "240.0kcal", Na: "65.0mg", sugar: "21.0g", saturatedFat: "5.0g", protein: "3.0g", caffeine: "0.0mg" ),

    MenuModel(name: "퐁크러쉬 마카롱", price: 2100, image: UIImage(named: "퐁크러쉬 마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 퐁크러쉬를 모티브로 만든 달콤바삭 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

    MenuModel(name: "플레인퐁크러쉬", price: 3900, image: UIImage(named: "플레인퐁크러쉬") ?? UIImage(), explanation: "우유에 죠리퐁 씨리얼이 믹싱 된 얼음을 갈아 만든 시원한 프라페음료", standard: "20oz", calorie: "468.6kcal", Na: "154.8mg", sugar: "46.2g", saturatedFat: "6.0g", protein: "10.6g", caffeine: "0.0mg" ),

    MenuModel(name: "몽쉘케이크", price: 5300, image: UIImage(named: "몽쉘케이크") ?? UIImage(), explanation: "진하고 폭신한 초콜릿 스펀지 사이에 부드러운 생크림이 듬뿍 들어간 몽쉘 케이크.", standard: "101g", calorie: "383.6kcal", Na: "210.0mg", sugar: "26.0g", saturatedFat: "14.2g", protein: "5.3g", caffeine: "0.0mg" )
]


struct categoryInfo {
    let categoryName: String
    var isClicked: Bool
}

var giftCategory = [

    categoryInfo(categoryName: "SET MENU", isClicked: false),
    categoryInfo(categoryName: "NEW&BEST", isClicked: false),
    categoryInfo(categoryName: "커피", isClicked: false),
    categoryInfo(categoryName: "디카페인", isClicked: false),
    categoryInfo(categoryName: "스무디&프라페", isClicked: false),
    categoryInfo(categoryName: "에이드&주스", isClicked: false),
    categoryInfo(categoryName: "음료", isClicked: false),
    categoryInfo(categoryName: "티(TEA)", isClicked: false),
    categoryInfo(categoryName: "에스프레소", isClicked: false),
    categoryInfo(categoryName: "디저트", isClicked: false),
    categoryInfo(categoryName: "MD상품", isClicked: false),
    categoryInfo(categoryName: "금액권", isClicked: false)
]

var Menu = [
    MenuModels(type: .set, products:
                [MenuModel(name: "버터소금빵(프레지덩버터)세트", price: 4700, image: UIImage(named: "버터소금빵(프레지덩버터)세트") ?? UIImage(), explanation: "버터 소금빵 + 프레지덩 버터 + (HOT)아메리카노 = 4,700원", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "크루아상(프레지덩버터)세트", price: 4700, image: UIImage(named: "크루아상(프레지덩버터)세트") ?? UIImage(), explanation: "크라우상 + 프레지덩 버터 + (HOT)아메리카노 = 4,700원", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "잠봉버터블랙소금빵세트", price: 6900, image: UIImage(named: "잠봉버터블랙소금빵세트") ?? UIImage(), explanation: "잠봉 버터 블랙소금빵+아메리카노", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "버터소금빵(쥬에그잼)세트", price: 5000, image: UIImage(named: "버터소금빵(쥬에그잼)세트") ?? UIImage(), explanation: "버터 소금빵 + 쥬에그잼 + (HOT)아메리카노 = 5,000원", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "크루아상(쥬에그잼)세트", price: 5000, image: UIImage(named: "크루아상(쥬에그잼)세트") ?? UIImage(), explanation: "크루아상 + 쥬에그잼 + (HOT)아메리카노 = 5,000원", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "더블 아아 세트", price: 4000, image: UIImage(named: "더블 아아 세트") ?? UIImage(), explanation: "(ICE)아메리카노 2잔", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "더블 라떼 세트", price: 5800, image: UIImage(named: "더블 라떼 세트") ?? UIImage(), explanation: "(ICE)카페라떼 2잔", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "더블 바닐라라떼 세트", price: 6800, image: UIImage(named: "더블 바닐라라떼 세트") ?? UIImage(), explanation: "(ICE)바닐라라떼 2잔", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤 아메 세트", price: 5700, image: UIImage(named: "달콤 아메 세트") ?? UIImage(), explanation: "(ICE)딸기라떼 + (ICE)아메리카노", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤한잔세트", price: 4100, image: UIImage(named: "달콤한잔세트") ?? UIImage(), explanation: "마카롱 1종+(ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤한마카롱세트", price: 12600, image: UIImage(named: "달콤한마카롱세트") ?? UIImage(), explanation: "쿠키프라페 마카롱 2종, 퐁크러쉬 마카롱 2종, 유니콘프라페 마카롱 2종으로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤한하루세트", price: 5500, image: UIImage(named: "달콤한하루세트") ?? UIImage(), explanation: "초코무스 케이크 + (ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "메가POWER세트", price: 11200, image: UIImage(named: "메가POWER세트") ?? UIImage(), explanation: "티라미수 케이크+메가초코+메가에이드로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "메가 꿀 조합 세트", price: 10400, image: UIImage(named: "메가 꿀 조합 세트") ?? UIImage(), explanation: "허니브래드+플레인 퐁크러쉬+(ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "베리설렘세트", price: 6000, image: UIImage(named: "베리설렘세트") ?? UIImage(), explanation: "마카롱 1종+딸기쿠키프라페로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "아침은내가챙겨줄게", price: 5800, image: UIImage(named: "아침은내가챙겨줄게") ?? UIImage(), explanation: "크로크무슈+(ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "너랑 썸탈꺼야 세트", price: 10200, image: UIImage(named: "너랑 썸탈꺼야 세트") ?? UIImage(), explanation: "허니브레드+딸기라떼+(ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤달콤해세트", price: 5800, image: UIImage(named: "달콤달콤해세트") ?? UIImage(), explanation: "마카롱 1종+딸기라떼로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "수고했어오늘도", price: 6200, image: UIImage(named: "수고했어오늘도") ?? UIImage(), explanation: "핫도그+딸기라떼로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
                 MenuModel(name: "달콤충전세트", price: 10000, image: UIImage(named: "달콤충전세트") ?? UIImage(), explanation: "마카롱 3종+딸기라뗴로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
                ]),
    MenuModels(type: .newAndBest, products: [
        MenuModel(name: "태극전사레드불에너지", price: 4400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "붉은악마레드불에너지", price: 4400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "스모어블랙쿠키프라페", price: 4400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "(HOT)레드오렌지뱅쇼티플레저", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "(ICE)레드오렌지뱅쇼티플레저", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "따끈따끈한간식꾸러미", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "경산대추과즐", price: 1900, image: UIImage(named: "경산대추과즐") ?? UIImage(), explanation: "경산 대추와 우리 밀을 넣은 달콤 쫀득한 피에 국내산 조청과 쌀 튀밥을 입혀 바삭하게 구운 한과", standard: "28g", calorie: "116kcal", Na: "27g", sugar: "5g", saturatedFat: "1.3g", protein: "2g", caffeine: "0g"),
        MenuModel(name: "허니버터피자", price: 5100, image: UIImage(named: "허니버터피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 버터, 모짜렐라 치즈, 꿀을 더해 든든하게 만든 단짠단짠 허니버터 피자", standard: "145g", calorie: "500kcal", Na: "650g", sugar: "9g", saturatedFat: "14g", protein: "19g", caffeine: "0.0g" ),
        MenuModel(name: "마르게리타피자", price: 5400, image: UIImage(named: "마르게리타피자") ?? UIImage(), explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 토마토소스, 모짜렐라 치즈 바질을 더해 든든하게 만든 풍미가득 마르게리타 피자", standard: "140g", calorie: "360kcal", Na: "630g", sugar: "8g", saturatedFat: "4.5g", protein: "14g", caffeine: "0.0g"),
        MenuModel(name: "버터소금빵(프레지덩버터)", price: 3200, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "잠봉버터블랙소금빵", price: 5400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
        MenuModel(name: "스테비아 케이스", price: 5900, image: UIImage(named: "스테비아 케이스") ?? UIImage(), explanation: "천연 감미료 스테비아 1gx40개입 케이스.", standard: "1g X 40ea", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""  ),

        MenuModel(name: "에스프레소 피에노", price: 2400, image: UIImage(named: "에스프레소 피에노") ?? UIImage(), explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"  ),

        MenuModel(name: "젤라또 아포가토", price: 3200, image: UIImage(named: "젤라또 아포가토") ?? UIImage(), explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg"  ),

        MenuModel(name: "(HOT)아메리카노", price: 1500, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "20oz", calorie: "12.2kcal", Na: "2.4mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.0g", caffeine: "204.2mg"  ),

        MenuModel(name: "달콤한하루세트", price: 5500, image: UIImage(named: "달콤한하루세트") ?? UIImage(), explanation: "초코무스 케이크 + (ICE)아메리카노로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)메가초코", price: 3800, image: UIImage(named: "(ICE)메가초코") ?? UIImage(), explanation: "부드러운 우유에 진한 초코소스, 달콤한 휘핑크림의 삼박자 조화로 완성한 달콤 초코 음료.", standard: "20oz", calorie: "507.0kcal", Na: "218.0mg", sugar: "31.3g", saturatedFat: "12.0g", protein: "11.9g", caffeine: "51.8mg" ),

        MenuModel(name: "(ICE)아메리카노", price: 2000, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "메가에이드", price: 3900, image: UIImage(named: "메가에이드") ?? UIImage(), explanation: "상큼한 레몬, 상쾌한 라임, 달콤쌉싸름한 자몽의 3색 맛을 한데 어우른 메가MGC커피 시그니처 에이드.", standard: "24oz", calorie: "292.4kcal", Na: "9.1mg", sugar: "53.9g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0mg" ),

        MenuModel(name: "유니콘프라페", price: 4800, image: UIImage(named: "유니콘프라페") ?? UIImage(), explanation: "다채로운 비주얼로 보는 즐거움을 채우고, 달콤함과 상큼함 색깔마다 달라지는 유쾌한 맛까지 잡은 이색프라페.", standard: "20oz", calorie: "474.5kcal", Na: "141.2mg", sugar: "42.3g", saturatedFat: "11.1g", protein: "7.0g", caffeine: "0.0mg" ),

        MenuModel(name: "유니콘프라페마카롱", price: 2100, image: UIImage(named: "유니콘프라페마카롱") ?? UIImage(), explanation: "메가커피 인기 음료인 유니콘 프라페를 모티브로 만든 매지컬 비주얼 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

        MenuModel(name: "쿠키프라페", price: 3900, image: UIImage(named: "쿠키프라페") ?? UIImage(), explanation: "바삭하고 달콤한 오레오와 고소한 우유, 부드러운 바닐라향의 조화를 느낄 수 있는 프라페.", standard: "20oz", calorie: "640.7kcal", Na: "332.5mg", sugar: "39.4g", saturatedFat: "16.9g", protein: "9.8g", caffeine: "5.5mg" ),

        MenuModel(name: "쿠키프라페마카롱", price: 2100, image: UIImage(named: "쿠키프라페마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 쿠키프라페를 모티브로 만든 달콤한 마카롱.", standard: "50g", calorie: "240.0kcal", Na: "65.0mg", sugar: "21.0g", saturatedFat: "5.0g", protein: "3.0g", caffeine: "0.0mg" ),

        MenuModel(name: "퐁크러쉬 마카롱", price: 2100, image: UIImage(named: "퐁크러쉬 마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 퐁크러쉬를 모티브로 만든 달콤바삭 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

        MenuModel(name: "플레인퐁크러쉬", price: 3900, image: UIImage(named: "플레인퐁크러쉬") ?? UIImage(), explanation: "우유에 죠리퐁 씨리얼이 믹싱 된 얼음을 갈아 만든 시원한 프라페음료", standard: "20oz", calorie: "468.6kcal", Na: "154.8mg", sugar: "46.2g", saturatedFat: "6.0g", protein: "10.6g", caffeine: "0.0mg" ),

        MenuModel(name: "몽쉘케이크", price: 5300, image: UIImage(named: "몽쉘케이크") ?? UIImage(), explanation: "진하고 폭신한 초콜릿 스펀지 사이에 부드러운 생크림이 듬뿍 들어간 몽쉘 케이크.", standard: "101g", calorie: "383.6kcal", Na: "210.0mg", sugar: "26.0g", saturatedFat: "14.2g", protein: "5.3g", caffeine: "0.0mg" ),

        MenuModel(name: "달콤달콤해세트", price: 5800, image: UIImage(named: "달콤달콤해세트") ?? UIImage(), explanation: "마카롱 1종+딸기라떼로 구성됩니다.", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),
    MenuModels(type: .coffee, products: [
        MenuModel(name: "(ICE)아메리카노", price: 2000, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(HOT)아메리카노", price: 1500, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "20oz", calorie: "12.2kcal", Na: "2.4mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.0g", caffeine: "204.2mg"  ),

        MenuModel(name: "(ICE)메가리카노", price: 3000, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(ICE)꿀아메리카노", price: 2700, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(HOT)꿀아메리카노", price: 2700, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(ICE)바닐라아메리카노", price: 2700, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(HOT)바닐라아메리카노", price: 2700, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(ICE)헤이즐넛아메리카노", price: 2700, image: UIImage(named: "(ICE)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(HOT)헤이즐넛아메리카노", price: 2700, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(ICE)카페라떼", price: 2900, image: UIImage(named: "(HOT)아메리카노") ?? UIImage(), explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),

        MenuModel(name: "(HOT)카페라떼", price: 2900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)카푸치노", price: 2900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)카푸치노", price: 2900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)바닐라라떼", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)바닐라라뗴", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)헤이즐넛라뗴", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)헤이즐넛라뗴", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)연유라뗴", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)카라멜마끼아또", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)카라멜마끼아또", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)카페모카", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)콜드브루오리지널", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)콜드브루오리지널", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)콜드브루라뗴", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)콜드브루라뗴", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)카페모카", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)티라미수라떼", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)티라미수라뗴", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)민트카페모카", price: 4500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)민트카페모카", price: 4500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)큐브라뗴", price: 4200, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),

    MenuModels(type: .decaffeine, products: [
        MenuModel(name: "(ICE)콜드브루디카페인", price: 3500, image: UIImage(contentsOfFile: "(HOT)아메리카노)") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)콜드브루디카페인", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)콜드브루디카페인라떼", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)콜드브루디카페인라떼", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),
    MenuModels(type: .smoothieAndFrappe, products: [

        MenuModel(name: "녹차프라페", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기요거트스무디", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기쿠키프라페", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기퐁크러쉬", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "리얼초코프라페", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "망고요거트스무디", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "민트프라페", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "바나나퐁크러쉬", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "슈크림허니퐁크러쉬", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "스트로베리치즈홀릭", price: 4500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "초코허니퐁크러쉬", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "커피프라페", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "쿠키프라페", price: 3900, image: UIImage(named: "쿠키프라페") ?? UIImage(), explanation: "바삭하고 달콤한 오레오와 고소한 우유, 부드러운 바닐라향의 조화를 느낄 수 있는 프라페.", standard: "20oz", calorie: "640.7kcal", Na: "332.5mg", sugar: "39.4g", saturatedFat: "16.9g", protein: "9.8g", caffeine: "5.5mg" ),

        MenuModel(name: "플레인요거트스무디", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "플레인퐁크러쉬", price: 3900, image: UIImage(named: "플레인퐁크러쉬") ?? UIImage(), explanation: "우유에 죠리퐁 씨리얼이 믹싱 된 얼음을 갈아 만든 시원한 프라페음료", standard: "20oz", calorie: "468.6kcal", Na: "154.8mg", sugar: "46.2g", saturatedFat: "6.0g", protein: "10.6g", caffeine: "0.0mg" ),

        MenuModel(name: "플레인허니퐁크러쉬", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")

    ]),

    MenuModels(type: .aidAndJuice, products: [
        MenuModel(name: "라임모히또", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "레몬에이드", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "메가에이드", price: 3900, image: UIImage(named: "메가에이드") ?? UIImage(), explanation: "상큼한 레몬, 상쾌한 라임, 달콤쌉싸름한 자몽의 3색 맛을 한데 어우른 메가MGC커피 시그니처 에이드.", standard: "24oz", calorie: "292.4kcal", Na: "9.1mg", sugar: "53.9g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0mg" ),

        MenuModel(name: "블루레몬에이드", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "자몽모히또", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "자몽에이드", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "청포도모히또", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "청포도에이드", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기주스", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기바나나주스", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "오곡바나나주스", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "초코바나나주스", price: 4000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "유니콘매직에이드(핑크)", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "유니콘매직에이드(블루)", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "체리콕", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),
    MenuModels(type: .beverage, products: [

        MenuModel(name: "(HOT)고구마라뗴", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)곡물라뗴", price: 3000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)메가초코", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)민트크림초코", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)토피넛라떼", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)고구마라뗴", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)곡물라뗴", price: 3000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)메가초코", price: 3800, image: UIImage(named: "(ICE)메가초코") ?? UIImage(), explanation: "부드러운 우유에 진한 초코소스, 달콤한 휘핑크림의 삼박자 조화로 완성한 달콤 초코 음료.", standard: "20oz", calorie: "507.0kcal", Na: "218.0mg", sugar: "31.3g", saturatedFat: "12.0g", protein: "11.9g", caffeine: "51.8mg" ),

        MenuModel(name: "(ICE)민트크림초코", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)오레오초코라뗴", price: 3900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)토피넛라떼", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)흑당버블그린티라뗴", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)흑당버블밀크티라뗴", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "핫초코", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)녹차라뗴", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)로얄밀크티라떼", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)흑당라뗴", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)흑당밀크티라뗴", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)흑당버블라떼", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "아이스초코", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)녹차라뗴", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)딸기라떼", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)로얄밀크티라뗴", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),

    MenuModels(type: .tea, products: [
        MenuModel(name: "(HOT)녹차", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)사과유자차", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)얼그레이", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)캐모마일", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)페퍼민트", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)녹차", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)사과유자차", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)얼그레이", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)캐모마일", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)페퍼민트", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "복숭아아이스티", price: 3000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)유자차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)레몬차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)자몽차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(HOT)허니자몽블랙티", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)유자차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)래몬차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)자몽차", price: 3300, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "(ICE)허니자몽블랙티", price: 3700, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),

    MenuModels(type: .espresso, products: [

        MenuModel(name: "에스프레소", price: 1500, image: UIImage(named: "에스프레소") ?? UIImage(), explanation: "메가MGC커피 원두의 향미를 온전히 즐길 수 있는 에스프레소", standard: "2oz", calorie: "7.6kcal", Na: "0.2g", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.5g", caffeine: "104.8mg"),

        MenuModel(name: "에스프레소 도피오", price: 2000, image: UIImage(named: "에스프레소 도피오") ?? UIImage(), explanation: "더블샷으로 더욱 진하게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "15.2kcal", Na: "0.4mg", sugar: "0.0g", saturatedFat: "0.1g", protein: "1.0mg", caffeine: "184.7mg"),

        MenuModel(name: "에스프레소 피에노", price: 2400, image: UIImage(named: "에스프레소 피에노") ?? UIImage(), explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"),

        MenuModel(name: "젤라또 아포가토", price: 3200, image: UIImage(named: "젤라또 아포가토") ?? UIImage(), explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg")
    ]),

    MenuModels(type: .desert, products: [

        MenuModel(name: "버터소금빵(프레지덩버터)", price: 3200, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "크루아상(프레지덩버터)", price: 3200, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "잠봉버터블랙소금빵", price: 5400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "버터소금빵(쥬에그잼)", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "크루아상(쥬에그잼)", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "그릭요거 망고놀라", price: 4400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "딸기요거트 마카롱", price: 2100, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "떠먹는 쿠키앤크림케이크", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "떠먹는 티라미수케이크", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "말차스모어쿠키", price: 3400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "메가초코 마카롱", price: 2900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "바닐라 마카롱", price: 2100, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "아이스크림크로플", price: 3500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "아이스허니와앙슈", price: 2400, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "유니콘프라페마카롱", price: 2100, image: UIImage(named: "유니콘프라페마카롱") ?? UIImage(), explanation: "메가커피 인기 음료인 유니콘 프라페를 모티브로 만든 매지컬 비주얼 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

        MenuModel(name: "초코스모어쿠키", price: 2900, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "쿠키프라페마카롱", price: 2100, image: UIImage(named: "쿠키프라페마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 쿠키프라페를 모티브로 만든 달콤한 마카롱.", standard: "50g", calorie: "240.0kcal", Na: "65.0mg", sugar: "21.0g", saturatedFat: "5.0g", protein: "3.0g", caffeine: "0.0mg" ),

        MenuModel(name: "크로크무슈", price: 3800, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "퐁크러쉬 마카롱", price: 2100, image: UIImage(named: "퐁크러쉬 마카롱") ?? UIImage(), explanation: "메가커피 인기메뉴인 퐁크러쉬를 모티브로 만든 달콤바삭 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),

        MenuModel(name: "플레인크로플", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "한컵 망고놀라", price: 2500, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "몽쉘케이크", price: 5300, image: UIImage(named: "몽쉘케이크") ?? UIImage(), explanation: "진하고 폭신한 초콜릿 스펀지 사이에 부드러운 생크림이 듬뿍 들어간 몽쉘 케이크.", standard: "101g", calorie: "383.6kcal", Na: "210.0mg", sugar: "26.0g", saturatedFat: "14.2g", protein: "5.3g", caffeine: "0.0mg" ),

        MenuModel(name: "햄앤치즈샌드", price: 2000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "")
    ]),

    MenuModels(type: .md, products: [

        MenuModel(name: "스테비아 케이스", price: 5900, image: UIImage(named: "스테비아 케이스") ?? UIImage(), explanation: "천연 감미료 스테비아 1gx40개입 케이스.", standard: "1g X 40ea", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""  ),

        MenuModel(name: "머그컵(검정)", price: 9000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "머그컵(노랑)", price: 9000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "텀블러(실버)", price: 15000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "텀블러(브론즈)", price: 15000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),

        MenuModel(name: "텀블러(화이트)", price: 15000, image: UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""),
    ]),

    MenuModels(type: .giftcard, products: [
        MenuModel(name: "1만원 상품권", price: 10000, image: UIImage(named: "1만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

        MenuModel(name: "2만원 상품권", price: 20000, image: UIImage(named: "2만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

        MenuModel(name: "3만원 상품권", price: 30000, image: UIImage(named: "3만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),

        MenuModel(name: "5만원 상품권", price: 50000, image: UIImage(named: "3만원 상품권") ?? UIImage(), explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" )

    ])




]

