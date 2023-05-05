//
//  StoreInfoTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit

// MARK: [Protocol] ----------
protocol StoreInfoTableViewCellDelegate: AnyObject {
    func updateLikeButton(index: Int)
}

// MARK: [Class or Struct] ----------
class StoreInfoTableViewCell: UITableViewCell {
    
    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeOffView: UIView!
    @IBOutlet weak var storeOffLabel: UILabel!
    
    @IBOutlet weak var likeButtonView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: [Let Or Var] ----------
    weak var delegate: StoreInfoTableViewCellDelegate?
    var cellType = SelectedCategory.list
    
    var isSearch = false
    
    // MARK: [Override] ----------
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.alpha = 1
        addressLabel.alpha = 1
        distanceLabel.alpha = 1
        storeOffLabel.isHidden = false
        storeOffView.isHidden = false
        likeButton.tintColor = .systemGray
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        storeImageView.layer.cornerRadius = 0.5 * (storeImageView.image?.size.width ?? 0.0)
        storeOffView.layer.cornerRadius = 0.5 * (storeImageView.image?.size.width ?? 0.0)
        likeButtonView.layer.cornerRadius = likeButtonView.frame.width / 2
    }
    
    // MARK: [@IBAction] ----------

    // MARK: [Function] ----------
    func configData(storeData: StoreModel) {
        nameLabel.text = storeData.name
        addressLabel.text = storeData.address
        distanceLabel.text = "\(storeData.distance)m"
        
        storeImageView.image = resizeImage(image: storeData.storeImage, newWidth: 100)
        
        nameLabel.alpha = storeData.isOn ? 1 : 0.5
        addressLabel.alpha = storeData.isOn ? 1 : 0.5
        distanceLabel.alpha = storeData.isOn ? 1 : 0.5
        storeOffView.isHidden = storeData.isOn ? true : false
        storeOffLabel.isHidden = storeData.isOn ? true : false
        
        likeButton.tintColor = storeData.bookMark ? .systemPink : .systemGray
        likeButton.addTarget(self, action: #selector(tapLikeButton(_:)), for: .touchUpInside)
    }
    
    func getIndexPath() -> IndexPath? {
        guard let tableView = self.superview as? UITableView else { return nil }
        return tableView.indexPath(for: self)
    }
    
    // MARK: [@objc Function] ----------
    @objc func tapLikeButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
       
        let row = getIndexPath()?.row ?? 0
        
        switch cellType {
        case .list:
            if isSearch {
                let index = StoreModel.storeDatas.firstIndex(where: {$0.name == nameLabel.text ?? ""}) ?? 0
                // 원본 데이터 바꾸고
                StoreModel.storeDatas[index].bookMark.toggle()
                
                if StoreModel.storeDatas[index].bookMark {
                    StoreModel.likeStoreDatas.append(StoreModel.storeDatas[index])
                } else {
                    let index = StoreModel.likeStoreDatas.firstIndex(where: {$0.name == nameLabel.text ?? ""}) ?? 0
                    StoreModel.likeStoreDatas.remove(at: index)
                }
            
                delegate?.updateLikeButton(index: row)
            } else {
                StoreModel.storeDatas[row].bookMark.toggle()
                
                if StoreModel.storeDatas[row].bookMark {
                    StoreModel.likeStoreDatas.append(StoreModel.storeDatas[row])
                } else {
                    let index = StoreModel.likeStoreDatas.firstIndex(where: {$0.name == nameLabel.text ?? ""}) ?? 0
                    StoreModel.likeStoreDatas.remove(at: index)
                }
                delegate?.updateLikeButton(index: row)
            }
        case .map:
            print("아무동작 안함")
        case .like:
            let index = StoreModel.storeDatas.firstIndex(where: {$0.name == nameLabel.text ?? ""}) ?? 0
            StoreModel.likeStoreDatas.remove(at: row)
            StoreModel.storeDatas[index].bookMark.toggle()
            delegate?.updateLikeButton(index: row)
        }
    }
}
