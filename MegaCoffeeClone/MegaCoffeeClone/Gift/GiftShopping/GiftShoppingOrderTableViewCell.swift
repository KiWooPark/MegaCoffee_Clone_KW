//
//  GiftShoppingOrderTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/25.
//

import UIKit

class GiftShoppingOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var allTotalPriceLabel: UILabel!
    
    let coreDataManger = CoreDataManager.shared
    var goToPaymentView: GoToPaymentView?
    
    override func awakeFromNib() {
        //awakeFromNib() 은 객체가 초기화(인스턴스화)된 후 호출된다 따라서 tableView.reload시 초기화되지 않는것 같다.
        
        super.awakeFromNib()
        orderButton.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func orderButtonClicked(_ sender: UIButton) {
        //nib파일에서는 navigation을 컨트롤 할수 없는듯하다 -> delegate 패턴 사용
        goToPaymentView?.orderClicked()
    }
    
    

}
