//
//  GiftBoxContainerViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/04.
//

import UIKit

class GiftBoxContainerViewController: ViewController {
    
    @IBOutlet weak var GiftBoxColletionView: UICollectionView!
    
    var firstCategory = [GiftCategoryModel(categoryName: "받은 선물",isClicked: false),
                         GiftCategoryModel(categoryName: "보낸 선물", isClicked: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GiftBoxColletionView.collectionViewLayout = getLayout()
        GiftBoxColletionView.register(UINib(nibName: "GiftBoxCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "boxCategoryCell")
        firstCategory[0].isClicked = true
    }
    
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section , env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.firstSection()
            case 1:
                return self.secondSection()
            case 2:
                return self.thirdSection()
            case 3:
                return self.fourthSection()
            default:
                return self.firstSection()
            }
        }
    }
    
    func firstSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0) , top: .fixed(0), trailing: .fixed(1), bottom: .fixed(0))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .absolute(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: firstCategory.count)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func secondSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    func thirdSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    func fourthSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    func makeFalse() {
        for (index,_) in firstCategory.enumerated() {
            firstCategory[index].isClicked = false
        }
    }
    
    
    
}

extension GiftBoxContainerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return firstCategory.count
            
        }else if section == 1 {
            //받은 선물을 담을 array가 있다면 수정필요
            if firstCategory[0].isClicked == true {
                return 1
            } else {
                return 0
            }
            
        }else if section == 2 {
            if firstCategory[0].isClicked == true {
                return 1
            }else {
                return 1
            }
            
        } else {
            if firstCategory[0].isClicked == true {
                return 1
            }else {
                return 0
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boxCategoryCell", for: indexPath) as! GiftBoxCategoryCollectionViewCell
            cell.categoryLabel.text = firstCategory[indexPath.row].categoryName
            cell.categoryView.layer.cornerRadius = 15
            cell.categoryView.layer.borderColor = UIColor.lightGray.cgColor
            if firstCategory[indexPath.row].isClicked {
                cell.categoryView.layer.borderWidth = 0
                cell.categoryView.backgroundColor = UIColor.black
                cell.categoryLabel.textColor = UIColor.white
                
            } else {
                cell.categoryView.layer.borderWidth = 1
                cell.categoryView.backgroundColor = UIColor.white
                cell.categoryLabel.textColor = UIColor.lightGray
            }
            
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "registCouponCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noBoxCell", for: indexPath) as! GiftNoBoxCell
            if firstCategory[indexPath.row].isClicked {
                cell.label.text = "보낸 선물이 없습니다."
                return cell
            }else {
                cell.label.text = "받은 선물이 없습니다."
                return cell
            }
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "couponNoteCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            makeFalse()
            firstCategory[indexPath.row].isClicked = true
            collectionView.reloadData()
        }
    }
    
    
    
}

class GiftRegistCouponCell: UICollectionViewCell {
    
    @IBOutlet weak var registCouponButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registCouponButton.layer.borderWidth = 1
        registCouponButton.layer.borderColor = UIColor.systemGray5.cgColor
    }
}

class GiftNoBoxCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}


