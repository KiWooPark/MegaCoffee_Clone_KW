//
//  HomePointHistoryViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/18.
//

import UIKit

class HomeStampHistoryMainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var index = 0
    
    var text = ["일주일","1개월","3개월","전체"]
    //
    //    var name: [String] = ["스탬프적립{답십리초등학교점}","스탬프적립{답십리초등학교점}","스탬프적립{답십리초등학교점}"]
    //    var when: [String] = ["적립일시 11.11.11.11","적립일시 11.11.11.11","적립일시 11.11.11.11"]
    //    var num: [String] = ["+1","+1","+1"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let nibCell = UINib(nibName: "homeStampCollectionViewCell", bundle: nil)
        //        collectionView.register(nibCell, forCellWithReuseIdentifier: "stamp")
        
    }
    
    @IBAction func cellSelectBtn(_ sender: Any) {
        print("213")
    
    }
    @IBOutlet weak var category: UICollectionView!
    
}



extension HomeStampHistoryMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! homeStampHistoryCollectionViewCell
        cell.collectionViewLabel.text  = text[indexPath.row]
        cell.tag = indexPath.row
        
        cell.backvuew.layer.cornerRadius = 22
        cell.backvuew.layer.borderWidth = 1
        cell.backvuew.layer.borderColor = UIColor.lightGray.cgColor
        cell.backvuew.backgroundColor = UIColor.white
//        cell.backvuew.font = .boldSystemFont(ofSize: 18)
//        cell.backvuew.textColor = UIColor.lightGray
//
       //     cell.backvuew.textColor = UIColor.white
            
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            print(cell.tag)
            index = cell.tag
            tableView.reloadData()
        }
    }
    
    
}

extension HomeStampHistoryMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if index == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            return cell
        } else if index == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            return cell
        } else if index == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")!
            return cell
        } else {
            return UITableViewCell()
        }
    }
}


