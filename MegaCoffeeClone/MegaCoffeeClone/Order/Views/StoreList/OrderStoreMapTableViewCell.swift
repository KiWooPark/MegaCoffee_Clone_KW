//
//  StoreMapTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit
import MapKit

// MARK: [Protocol] ----------
protocol StoreMapTableViewCellDelegate: AnyObject {
    func popupView(storeData: StoreModel)
}

// MARK: [Class or Struct] ----------
class StoreMapTableViewCell: UITableViewCell {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var storeMapView: MKMapView!
    @IBOutlet weak var currentLocationButtonView: UIView!
    
    @IBOutlet weak var storeInfoView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var storeOffView: UIView!
    @IBOutlet weak var storeOffLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var storeInfoViewHeight: NSLayoutConstraint!

    // MARK: [Let Or Var] ----------
    var storeData: StoreModel?
    weak var delegate: StoreMapTableViewCellDelegate?
    
    var isTouch = false
    
    // MARK: [Override] ----------
    override func awakeFromNib() {
        super.awakeFromNib()
    
        configLayout()
    }
    
    // MARK: [@IBAction] ----------

    // MARK: [Function] ----------
    func configLayout() {
        currentLocationButtonView.layer.cornerRadius = 0.5 * currentLocationButtonView.frame.height
        
        storeInfoView.layer.cornerRadius = 15
        storeInfoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        storeImageView.layer.cornerRadius = 0.5 * storeImageView.frame.height
        storeOffView.layer.cornerRadius = 0.5 * storeOffView.frame.height
        
        closeButton.layer.cornerRadius = 10
        orderButton.layer.cornerRadius = 10
        
        storeInfoViewHeight.constant = 0
    }
    
    func configStoreInfo(storeData: StoreModel) {
        
        self.storeData = storeData
        
        nameLabel.text = storeData.name
        addressLabel.text = storeData.address
        distanceLabel.text = "\(storeData.distance)m"
        
        storeImageView.image = resizeImage(image: storeData.storeImage, newWidth: 100)
        
        nameLabel.alpha = storeData.isOn ? 1 : 0.5
        addressLabel.alpha = storeData.isOn ? 1 : 0.5
        distanceLabel.alpha = storeData.isOn ? 1 : 0.5
        
        storeOffView.isHidden = storeData.isOn ? true : false
        storeOffLabel.isHidden = storeData.isOn ? true : false
        
        currentLocationButton.addTarget(self, action: #selector(tapCurrentLocationButton(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(tapCloseButton(_:)), for: .touchUpInside)
        orderButton.addTarget(self, action: #selector(tapOrderButton(_:)), for: .touchUpInside)
    }
    
    // MARK: [@objc Function] ----------
    @objc func tapCurrentLocationButton(_ sender: Any) {
        isTouch.toggle()
        
        if isTouch {
            storeInfoViewHeight.constant = storeMapView.frame.height * 0.35
        } else {
            storeInfoViewHeight.constant = 0
        }
    }
    
    @objc func tapCloseButton(_ sender: Any) {
        tapCurrentLocationButton(sender)
    }
    
    @objc func tapOrderButton(_ sender: Any) {
        delegate?.popupView(storeData: storeData!)
    }
}


