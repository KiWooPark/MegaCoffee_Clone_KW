
//import Foundation
//import UIKit
//
//struct MenuModel {
//    let name: String
//    let price: String
//    let image: UIImage
//    let explanation: String
//    let standard: String
//    let calorie: String
//    let Na: String
//    let sugar: String
//    let saturatedFat: String
//    let protein: String
//    let caffeine: String
//}
//
//var mainImages = [UIImage(named: "Image1") ,UIImage(named: "Image2")]
//
//var RecommendMenu = [
//MenuModel(name: "마녀의비밀티플레저", price: "4,400원", image: UIImage(named: "마녀의비밀티플레저")!, explanation: "푸루티 베이스와 라벤더 티백이 어우러져 만든 달콤한 맛과 탄산캔디의 톡톡 터지는 재미로, 즐거움을 전하는 마법 같은 음료", standard: "24oz", calorie: "244.7kcal", Na: "21.4mg", sugar: "35.1g", saturatedFat: "0.2g", protein: "0.8g", caffeine: "0.0mg" ),
//
//MenuModel(name: "밀크몬스터도넛", price: "3,300원", image: UIImage(named: "밀크몬스터도넛")!, explanation: "폭신한 빵 사이에 부드러운 우유크림을 듬뿍 채워낸 크림 샌드 도넛", standard: "82g", calorie: "371.2kcal", Na: "181.7mg", sugar: "16.2g", saturatedFat: "17.7g", protein: "3.0g", caffeine: "0.0g"  ),
//
//MenuModel(name: "청도홍시스무디", price: "4,400원", image: UIImage(named: "청도홍시스무디")!, explanation: "부드러운 청도 홍시를 듬~뿍 담은 스무디", standard: "20oz", calorie: "194.7kcal", Na: "10.3g", sugar: "32.1g", saturatedFat: "0.0g", protein: "0.8g", caffeine: "0.0g"  ),
//
//MenuModel(name: "(ICE)청도홍시수정과티플레저", price: "3,900원", image: UIImage(named: "(ICE)청도홍시수정과티플레저")!, explanation: "청도 홍시에 메가MGC커피 시그니처 수정과 티백을 사용한 가을 시즌 한정 티 블랜딩 음료", standard: "24oz", calorie: "153.2kcal", Na: "15.4g", sugar: "20.3g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0g"  ),
//
//MenuModel(name: "(HOT)청도홍시수정과티플레저", price: "3,900원", image: UIImage(named: "(HOT)청도홍시수정과티플레저")!, explanation: "청도 홍시에 메가MGC커피 시그니처 수정과 티백을 사용한 가을 시즌 한정 티 블랜딩 음료", standard: "20oz", calorie: "148kcal", Na: "14.5g", sugar: "25.4g", saturatedFat: "0.0g", protein: "0.4g", caffeine: "0.0g"  ),
//
//MenuModel(name: "그릭요거홍시놀라", price: "4,400원", image: UIImage(named: "그릭요거홍시놀라")!, explanation: "청도 홍시와 새콤한 그릭요거트 그리고 건강한 그래놀라가 만나 든든하게 즐기는 한 끼 메뉴", standard: "14oz", calorie: "399.8kcal", Na: "92.5g", sugar: "40.7gg", saturatedFat: "2.5g", protein: "0.0g", caffeine: "0.0g"  ),
//
//MenuModel(name: "경산대추과즐", price: "1,900원", image: UIImage(named: "경산대추과즐")!, explanation: "경산 대추와 우리 밀을 넣은 달콤 쫀득한 피에 국내산 조청과 쌀 튀밥을 입혀 바삭하게 구운 한과", standard: "28g", calorie: "116kcal", Na: "27g", sugar: "5g", saturatedFat: "1.3g", protein: "2g", caffeine: "0g"  ),
//
//MenuModel(name: "마르게리타피자", price: "5,400원", image: UIImage(named: "마르게리타피자")!, explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 토마토소스, 모짜렐라 치즈 바질을 더해 든든하게 만든 풍미가득 마르게리타 피자", standard: "140g", calorie: "360kcal", Na: "630g", sugar: "8g", saturatedFat: "4.5g", protein: "14g", caffeine: "0.0g" ),
//
//MenuModel(name: "허니버터피자", price: "5,100원", image: UIImage(named: "허니버터피자")!, explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 버터, 모짜렐라 치즈, 꿀을 더해 든든하게 만든 단짠단짠 허니버터 피자", standard: "145g", calorie: "500kcal", Na: "650g", sugar: "9g", saturatedFat: "14g", protein: "19g", caffeine: "0.0g" ),
//
//MenuModel(name: "에스프레소 도피오", price: "2,000원", image: UIImage(named: "에스프레소 도피오")!, explanation: "더블샷으로 더욱 진하게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "15.2kcal", Na: "0.4mg", sugar: "0.0g", saturatedFat: "0.1g", protein: "1.0mg", caffeine: "184.7mg"  ),
//
//MenuModel(name: "에스프레소 피에노", price: "2,400원", image: UIImage(named: "에스프레소 피에노")!, explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"  ),
//
//MenuModel(name: "에스프레소", price: "1,500원", image: UIImage(named: "에스프레소")!, explanation: "메가MGC커피 원두의 향미를 온전히 즐길 수 있는 에스프레소", standard: "2oz", calorie: "7.6kcal", Na: "0.2g", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.5g", caffeine: "104.8mg" ),
//
//MenuModel(name: "젤라또 아포가토", price: "3,200원", image: UIImage(named: "젤라또 아포가토")!, explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg"  )
//]
//
//
//var MegaCardMenu = [
//MenuModel(name: "1만원 상품권", price: "10,000원", image: UIImage(named: "1만원 상품권")!, explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),
//
//MenuModel(name: "2만원 상품권", price: "20,000원", image: UIImage(named: "2만원 상품권")!, explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),
//
//MenuModel(name: "3만원 상품권", price: "30,000원", image: UIImage(named: "3만원 상품권")!, explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" ),
//
//MenuModel(name: "5만원 상품권", price: "50,000원", image: UIImage(named: "3만원 상품권")!, explanation: "", standard: "", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: "" )
//]
//
//
//var BestMenu = [
//    MenuModel(name: "경산대추과즐", price: "1,900원", image: UIImage(named: "경산대추과즐")!, explanation: "경산 대추와 우리 밀을 넣은 달콤 쫀득한 피에 국내산 조청과 쌀 튀밥을 입혀 바삭하게 구운 한과", standard: "28g", calorie: "116kcal", Na: "27g", sugar: "5g", saturatedFat: "1.3g", protein: "2g", caffeine: "0g"  ),
//
//    MenuModel(name: "허니버터피자", price: "5,100원", image: UIImage(named: "허니버터피자")!, explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 버터, 모짜렐라 치즈, 꿀을 더해 든든하게 만든 단짠단짠 허니버터 피자", standard: "145g", calorie: "500kcal", Na: "650g", sugar: "9g", saturatedFat: "14g", protein: "19g", caffeine: "0.0g" ),
//
//    MenuModel(name: "마르게리타피자", price: "5,400원", image: UIImage(named: "마르게리타피자")!, explanation: "이탈리아산 듀럼밀을 사용한 쫄깃한 도우에 토마토소스, 모짜렐라 치즈 바질을 더해 든든하게 만든 풍미가득 마르게리타 피자", standard: "140g", calorie: "360kcal", Na: "630g", sugar: "8g", saturatedFat: "4.5g", protein: "14g", caffeine: "0.0g" ),
//
//    MenuModel(name: "스테비아 케이스", price: "5,900원", image: UIImage(named: "스테비아 케이스")!, explanation: "천연 감미료 스테비아 1gx40개입 케이스.", standard: "1g X 40ea", calorie: "", Na: "", sugar: "", saturatedFat: "", protein: "", caffeine: ""  ),
//
//    MenuModel(name: "에스프레소 피에노", price: "2,400원", image: UIImage(named: "에스프레소 피에노")!, explanation: "크림과 코코아 파우더를 올려 부드럽게 즐길 수 있는 에스프레소", standard: "5oz", calorie: "112.4kcal", Na: "7.0mg", sugar: "4.8g", saturatedFat: "6.4g", protein: "1.2g", caffeine: "199.7mg"  ),
//
//    MenuModel(name: "젤라또 아포가토", price: "3,200원", image: UIImage(named: "젤라또 아포가토")!, explanation: "바닐라 젤라또에 진한 에스프레소를 부어 만든 디저트", standard: "10oz", calorie: "130.1kcal", Na: "55.3mg", sugar: "14.4g", saturatedFat: "1.9g", protein: "55.3mg", caffeine: "95.4mg"  ),
//
//    MenuModel(name: "(HOT)아메리카노", price: "1,500원", image: UIImage(named: "(HOT)아메리카노")!, explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "20oz", calorie: "12.2kcal", Na: "2.4mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "0.0g", caffeine: "204.2mg"  ),
//
//    MenuModel(name: "(ICE)메가초코", price: "1,500원", image: UIImage(named: "메가초코")!, explanation: "부드러운 우유에 진한 초코소스, 달콤한 휘핑크림의 삼박자 조화로 완성한 달콤 초코 음료.", standard: "20oz", calorie: "507.0kcal", Na: "218.0mg", sugar: "31.3g", saturatedFat: "12.0g", protein: "11.9g", caffeine: "51.8mg" ),
//
//    MenuModel(name: "(ICE)아메리카노", price: "2,000원", image: UIImage(named: "(ICE)아메리카노")!, explanation: "메가MGC커피 블렌드 원두로 추출한 에스프레소에 물을 더해, 풍부한 바디감을 느낄 수 있는 스탠다드 커피.", standard: "24oz", calorie: "12.2kcal", Na: "1.5mg", sugar: "0.0g", saturatedFat: "0.0g", protein: "1.0g", caffeine: "199.7mg" ),
//
//    MenuModel(name: "메가에이드", price: "3,900원", image: UIImage(named: "메가에이드")!, explanation: "상큼한 레몬, 상쾌한 라임, 달콤쌉싸름한 자몽의 3색 맛을 한데 어우른 메가MGC커피 시그니처 에이드.", standard: "24oz", calorie: "292.4kcal", Na: "9.1mg", sugar: "53.9g", saturatedFat: "0.0g", protein: "0.3g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "유니콘프라페", price: "4,800원", image: UIImage(named: "유니콘프라페")!, explanation: "다채로운 비주얼로 보는 즐거움을 채우고, 달콤함과 상큼함 색깔마다 달라지는 유쾌한 맛까지 잡은 이색프라페.", standard: "20oz", calorie: "474.5kcal", Na: "141.2mg", sugar: "42.3g", saturatedFat: "11.1g", protein: "7.0g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "유니콘프라페마카롱", price: "4,800원", image: UIImage(named: "유니콘프라페마카롱")!, explanation: "메가커피 인기 음료인 유니콘 프라페를 모티브로 만든 매지컬 비주얼 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "쿠키프라페", price: "3,900원", image: UIImage(named: "쿠키프라페")!, explanation: "바삭하고 달콤한 오레오와 고소한 우유, 부드러운 바닐라향의 조화를 느낄 수 있는 프라페.", standard: "20oz", calorie: "640.7kcal", Na: "332.5mg", sugar: "39.4g", saturatedFat: "16.9g", protein: "9.8g", caffeine: "5.5mg" ),
//
//    MenuModel(name: "쿠키프라페마카롱", price: "2,100원", image: UIImage(named: "쿠키프라페마카롱")!, explanation: "메가커피 인기메뉴인 쿠키프라페를 모티브로 만든 달콤한 마카롱.", standard: "50g", calorie: "240.0kcal", Na: "65.0mg", sugar: "21.0g", saturatedFat: "5.0g", protein: "3.0g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "퐁크러쉬 마카롱", price: "2,100원", image: UIImage(named: "퐁크러쉬 마카롱")!, explanation: "메가커피 인기메뉴인 퐁크러쉬를 모티브로 만든 달콤바삭 마카롱.", standard: "47g", calorie: "230.6kcal", Na: "32.1mg", sugar: "19.4g", saturatedFat: "5.8g", protein: "3.8g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "플레인퐁크러쉬", price: "3,900원", image: UIImage(named: "플레인퐁크러쉬")!, explanation: "우유에 죠리퐁 씨리얼이 믹싱 된 얼음을 갈아 만든 시원한 프라페음료", standard: "20oz", calorie: "468.6kcal", Na: "154.8mg", sugar: "46.2g", saturatedFat: "6.0g", protein: "10.6g", caffeine: "0.0mg" ),
//
//    MenuModel(name: "몽쉘케이크", price: "5,300원", image: UIImage(named: "몽쉘케이크")!, explanation: "진하고 폭신한 초콜릿 스펀지 사이에 부드러운 생크림이 듬뿍 들어간 몽쉘 케이크.", standard: "101g", calorie: "383.6kcal", Na: "210.0mg", sugar: "26.0g", saturatedFat: "14.2g", protein: "5.3g", caffeine: "0.0mg" )
//]
