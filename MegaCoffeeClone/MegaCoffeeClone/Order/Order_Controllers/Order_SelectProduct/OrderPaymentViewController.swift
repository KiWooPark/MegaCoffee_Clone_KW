//
//  OrderPaymentViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/13.
//

import UIKit
import MapKit

class OrderPaymentViewController: UIViewController {

    @IBOutlet var paymentTableView: UITableView!
    
    var isProductCellOpen = true
    var isWarningCellOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        paymentTableView.sectionHeaderHeight = 0
    }
}

extension OrderPaymentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return isProductCellOpen ? 3 : 0
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return 1
        } else if section == 6 {
            return 1
        } else if section == 7 {
            return 1
        } else if section == 8 {
            return isWarningCellOpen ? 1 : 0
        } else if section == 9 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productHeaderCell") as? OrderPaymentProductHeaderTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productListCell") as? OrderPaymentProductTableViewCell else { return UITableViewCell() }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "requestsCell") as? OrderPaymentRequestsTableViewCell else { return UITableViewCell() }
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "couponCell")!
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell")!
            return cell
        } else if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "payment") as? OrderPaymentListTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cashCell")!
            return cell
        } else if indexPath.section == 7 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "totalPriceCell") as? OrderPaymentTotalPriceTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else if indexPath.section == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "warningCell")!
            return cell
        } else if indexPath.section == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "finishPaymentCell")!
            return cell
        }
        
        return UITableViewCell()
    }
}

extension OrderPaymentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        } else if section == 7 {
            return CGFloat.leastNormalMagnitude
        } else if section == 8 {
            return CGFloat.leastNormalMagnitude
        } else {
            return 10
        }
    }
}

extension OrderPaymentViewController: OrderPaymentProductHeaderTableViewCellDelegate {
    func expandProductSection(isOpen: Bool) {
        self.isProductCellOpen = isOpen
        paymentTableView.reloadSections(IndexSet(integer: 1), with: .fade)
    }
}

extension OrderPaymentViewController: OrderPaymentTotalPriceTableViewCellDelegate {
    func expandWarningSection(isOpen: Bool) {
        self.isWarningCellOpen = isOpen
        paymentTableView.reloadSections(IndexSet(integer: 8), with: .fade)
    }
}

extension OrderPaymentViewController: OrderPaymentListTableViewCellDelegate {
    func reloadCell() {
        paymentTableView.reloadSections(IndexSet(integer: 5), with: .none)
    }
}
