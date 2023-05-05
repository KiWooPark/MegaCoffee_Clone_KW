//
//  HomePopupViewController.swift
//  MegaCoffeeClone
//

import UIKit

class HomePopupViewController: UIViewController {
    
    @IBOutlet weak var homePopupimage: UIImageView!
    
    @IBOutlet weak var homePopupMenu: UILabel!
    
    @IBOutlet weak var homePopupText: UILabel!
    
   // var imageReceived  = UIImage()
    var menuReceive : String = ""
    var menuText : String = ""
    var viewcontroller: HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(menuReceive)
        
      //  homePopupimage?.image = UIImage(named: imageReceived)
        homePopupMenu?.text = menuReceive
        homePopupText?.text = menuText
    }
    
    @IBAction func homeGoToOrder(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Order", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "orderVC") as! OrderViewController
        let nvc = self.presentationController?.presentingViewController
        
        self.dismiss(animated: false) {
            self.viewcontroller?.navigationController?.pushViewController(vc, animated: true)
        }

//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.isNavigationBarHidden = false

        //self.navigationController?.pushViewController(vc, animated: true)
 
        
         //self.present(vc, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Order", bundle: nil)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "orderVC")
//        as? OrderViewController
//
//        //self.navigationController?.pushViewController(vc!, animated: true)
//        self.present(vc, animated: true, completion: nil)

    }
    
    


@IBAction func homeGoToGift(_ sender: Any) {
//    let popvc = self.storyboard?.instantiateViewController(withIdentifier: "orderVC")
//    //vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
//    popvc?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
//    self.present(popvc!, animated: true, completion: nil)
//
//    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
//    as? GiftDetailViewController
//
//    self.navigationController?.pushViewController(vc!, animated: true)
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Gift", bundle: nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "DetailView") as! GiftDetailViewController
    _ = self.presentationController?.presentingViewController
    
    self.dismiss(animated: false) {
        self.viewcontroller?.navigationController?.pushViewController(vc, animated: true)

    }
}

@IBAction func homeClose(_ sender: UIButton) {
    
    dismiss(animated: true,completion: nil)
}

}


