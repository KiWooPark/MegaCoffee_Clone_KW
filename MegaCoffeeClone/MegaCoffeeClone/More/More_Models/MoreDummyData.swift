//
//  TermsOfServiceModel.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/22.
//

import Foundation
import UIKit



// MARK: [1] [ 주문내역 ]
let week1Data = [
    
    Week1Model(stateLabel: "픽업완료", storeLabel: "문정로데오점", menuLabel: "망고요거트스무디", menuCountLabel: "1개", dateLabel: "2022.10.26", orderNumberLabel: "주문번호: 0002", detailDateLabel: "2022.10.26. 08:53", priceLabel: "3,900원"),
    Week1Model(stateLabel: "픽업완료", storeLabel: "강남점", menuLabel: "아메리카노",  menuCountLabel: "5개", dateLabel: "2022.10.21", orderNumberLabel: "주문번호: 0013", detailDateLabel: "2022.10.21. 19:32", priceLabel: "2,000원"),
    Week1Model(stateLabel: "픽업완료", storeLabel: "역삼점", menuLabel: "아메리카노",  menuCountLabel: "3개", dateLabel: "2022.10.16", orderNumberLabel: "주문번호: 0001", detailDateLabel: "2022.10.16. 14:44", priceLabel: "1,500원"),
    Week1Model(stateLabel: "픽업완료", storeLabel: "선릉점", menuLabel: "아메리카노",  menuCountLabel: "1개", dateLabel: "2022.09.20", orderNumberLabel: "주문번호: 0030", detailDateLabel: "2022.09.20. 13:21", priceLabel: "2,000원"),
    Week1Model(stateLabel: "픽업완료", storeLabel: "문정중앙점", menuLabel: "아메리카노",  menuCountLabel: "2개", dateLabel: "2022.09.10", orderNumberLabel: "주문번호: 0004", detailDateLabel: "2022.09.10. 21:23", priceLabel: "1,500원")
  
]












// MARK: [4] [ 이벤트 및 공지사항 ]

// 이벤트
let eventModel = [
    
    EventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "MEGA MGC STICK 출시", dateLabel: "2022.11.17 - 2023.12.31"),
    EventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "[이벤트] AR손흥민 프로모션", dateLabel: "2022.11.14 - 2022.12.18"),
    EventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "[이벤트]메가MGC커피 X 원큐페이 적립 EVENT", dateLabel: "2022.11.07 - 2022.11.30")

]

// 공지사항
let noticeModel = [
    
    NoticeModel(titleLabel: "[신메뉴 출시] 겨울이 오는 달콤한 상상", dateLabel: "2022.11.07"),
    NoticeModel(titleLabel: "[공지] 홍시 마니아를 찾아라! 이벤트 당첨자 발표", dateLabel: "2022.11.04"),
    NoticeModel(titleLabel: "[공지] 'MEGA 할로윈 몬스터왕' 이벤트 당첨자 발표", dateLabel: "2022.11.04"),
    NoticeModel(titleLabel: "[공지] 'MEGA 할로윈 몬스터왕을 찾아라' 랭킹이벤트 조기 종료 안내", dateLabel: "2022.10.31"),
    NoticeModel(titleLabel: "[신메뉴 출시] 에너지 가득한 NEW 취향 탄생", dateLabel: "2022.11.07"),
    NoticeModel(titleLabel: "[공지] 썸머과일왕 최종당첨자 발표", dateLabel: "2022.09.08"),
    NoticeModel(titleLabel: "[공지] 메가MGC커피 일부 디저트 상품 가격 조정 안내", dateLabel: "2022.08.30")

]


// 랭킹이벤트
let rankingEventModel = [
    
    RankingEventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "메가 마니아를 찾아라", dateLabel: "2022.11.07 - 2022.12.31"),
    RankingEventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "MEGA 할로윈 몬스터왕을 찾아라", dateLabel: "2022.10.06 - 2022.10.30"),
    RankingEventModel(titleImgView: UIImageView(image: UIImage(systemName: "") ?? UIImage()), titleLabel: "홍시마니아를 찾아라!", dateLabel: "2022.09.01 - 2022.10.30")

]









// MARK: [5] [ 이용약관 ]

struct MoreTermsOfServiceDummyData {
    
    static var menu: [String] =
    ["서비스 이용약관","메가선불카드 이용약관","개인정보 처리방침","마케팅 활용 동의","위치 기반 서비스 이용 동의"]
    
    
    static var termsOfServiceData: String =
    """
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관


    서비스 이용약관


    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관
    서비스 이용약관


    서비스 이용약관
    서비스 이용약관
    """
    
    
    static var termsOfMegaCardData: String =
    """
    메가선불카드 이용약관
    메가선불카드 이용약관
    메가선불카드 이용약관
    메가선불카드 이용약관
    메가선불카드 이용약관
    
    메가선불카드 이용약관
    메가선불카드 이용약관
    
    
    메가선불카드 이용약관
    
    
    메가선불카드 이용약관
    """
    
    
    static var privacyPolicy: String =
    """
    개인정보 처리방침
    개인정보 처리방침
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    개인정보 처리방침
    개인정보 처리방침
    
    
    
    
    
    개인정보 처리방침
    """
    
    
    static var consentToUseForMarketing: String =
    """
    마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의
    
    
    
    
    
    
    
    
    
    
    
    
    
    마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의마케팅 활용 동의
    """
    
    
    static var consentToUseOfLocationBasedServices: String =
    """
    위치 기반 서비스 이용 동의


    위치 기반 서비스 이용 동의
    위치 기반 서비스 이용 동의위치 기반 서비스 이용 동의
    위치 기반 서비스 이용 동의위치 기반 서비스 이용 동의
    위치 기반 서비스 이용 동의위치 기반 서비스 이용 동의

    """
    

}

