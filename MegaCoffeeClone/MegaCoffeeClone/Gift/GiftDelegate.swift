//
//  GiftPopupDelegate.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/18.
//

import Foundation
import UIKit

protocol PopupDelegate {
    func goShoppingButtonClicked()
}


protocol CanCelDelegate {
    func cancelClicked(index: Int)
}

protocol GoToPaymentView {
    func orderClicked()
}

protocol ShowMoreDelegate {
    func paging()
}

protocol searchBarDelegate {
    func searchClicked(text: String)
    func resetTable()
}
