
import UIKit

class HomeFirstCouponViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
   // @IBOutlet weak var addCoupon: UIButton!
    
   // @IBOutlet weak var addCoupon: UIButton!
    
    @IBOutlet weak var addCouponView: UIView!
    
    
    
    var HomeCouponImage: Array<String> = ["homeRecommend1","homeRecommend2"]
    
    var HomeCouponPlace: Array<String> = ["강남 로데오점","왕십리역점"]
    var HomeCouponMenu: Array<String> = ["아이스 아메리카노","따끈따끈간식꾸러미세트"]
    var HomeCouponPeriod: Array<String> = ["유효기간: ~ 11.07","유효기간 ~ 11.09"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeCouponTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "HomeCouponTableViewCell")

        addCouponView.layer.borderWidth = 1
        addCouponView.layer.borderColor = UIColor.black.cgColor
        addCouponView.layer.cornerRadius = 22

       // HomeCouponImage.layer.cornerRadius = 40

    }
    
    

    @IBAction func homeAddCoupon(_ sender: Any) {

//        print("123")
//        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "addCoupon")
//        vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
//        vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
//        self.present(vcName!, animated: true, completion: nil)

        guard let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "addCoupon")  else {return}
              
          self.navigationController?.pushViewController(signUpVC, animated: true)

    }
    
    
}

extension HomeFirstCouponViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HomeCouponImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCouponTableViewCell", for: indexPath) as! HomeCouponTableViewCell
        
        
        cell.HomeCouponImage.image = UIImage(named: HomeCouponImage[indexPath.row])
        cell.HomeCouponMenu.text =  HomeCouponMenu[indexPath.row]
        cell.HomeCouponPlace.text =  HomeCouponPlace[indexPath.row]
        cell.HomeCouponPeriod.text =  HomeCouponPeriod[indexPath.row]
        return cell
    }
    
    
    
}
