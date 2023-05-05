import UIKit
import SafariServices

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomePageBtn: UIButton!
    @IBOutlet weak var mainHead: UIImageView!
    @IBOutlet weak var HomeBarcode: UIButton!
    // @IBOutlet weak var HomeAlarm: UIButton!
    
    @IBOutlet weak var MainBackgroundView: UIView!
    @IBOutlet weak var homeBanner: UICollectionView!
    
    @IBOutlet weak var StampbackgroundView: UIView!
    @IBOutlet weak var stamp: UIView!
    @IBOutlet weak var coupon: UIView!
    
    @IBOutlet weak var HomemainCollectionView: UICollectionView!
    
    @IBOutlet weak var homeRecommend: UICollectionView!
    @IBOutlet weak var homeNews: UICollectionView!
    
    @IBOutlet weak var webButton: UIButton!
    
    @IBOutlet weak var webview: UIView!
    @IBOutlet weak var webimage: UIImageView!
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    
    //MARK: String Data 모음
    // Banner 데이터 배열
    let bannerDataArray: Array<UIImage> = [UIImage(named: "homeBanner1")!,UIImage(named: "homeBanner2")!,UIImage(named: "homeBanner3")!]
    
    //recommend 데이터배열
    var homeRecommendM:[String] = ["homeRecommend1","homeRecommend2","homeRecommend3","homeRecommend4"]
    
    var homeRecommendText:[String] = ["태극전사레드불에너지","스모어블랙쿠키프라페","(뜨거워)레드오렌지뱅쇼티플레져","따끈따끈간식꾸러미"]
    
    //news 데이터배열
    var homeNewsImagedata:[String] = ["img1","img2"]
    var homeNewsText:[String] = ["[이벤트] 겨울 신메뉴 출시기념 이벤트","뉴스2"]
    
    //recommend popup데이터
    var homePopupimage:[String] = ["homeRecommend1","homeRecommend2","homeRecommend3","homeRecommend4"]
    var homePopupMenu = ["태극전사레드불에너지","스모어블랙쿠키프라페","(뜨거워)레드오렌지뱅쇼티플레져","따끈따끈간식꾸러미"]
    var homePopupText = ["우리나라 국기의 태극 문양을 표현한 트로피컬 맛의 에너지드링크(with Red Bull Sugarfree)","진한 초코 스무디에 바삭한 쿠키를 넣어 퐁신퐁신한 마시멜로우 잼과 함께 달콤하게 즐기는 스무디","안토시아닌이 풍부하게 들어간 레드오렌지 뱅쇼베이스에 와인 티백을 활용한 티플레저","겨울에 생각나는 팥부어빵빵빵빵으로 구성된 간식 꾸러미"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //gif
        let MainHead = UIImage.gifImageWithName("MainHead")
        mainHead?.image = MainHead
        
        //스탬프 사이즈
        StampbackgroundView?.layer.cornerRadius = 13
        MainBackgroundView?.layer.cornerRadius = 15
        homeBanner?.layer.cornerRadius = 15
        //        HomePageBtn.layer.cornerRadius = 120
        //        HomemainCollectionView.collectionViewLayout = getLayout()
        
        //배너
        homeBanner?.register(HomeBannerCollectionViewCell.self, forCellWithReuseIdentifier: "HomeBannerCollectionViewCell")
        
        //recommend
        let nibcell = UINib(nibName: "HomeRecommendCollectionViewCell", bundle: nil)
        homeRecommend.register(nibcell, forCellWithReuseIdentifier: "cell2")
        
        
        // News
        let nibcell2 = UINib(nibName: "HomeNewsCollectionViewCell", bundle: nil)
        homeNews.register(nibcell2, forCellWithReuseIdentifier: "cell3")
        
        //쿠폰개월수
        
        //배너 타이머
        bannerTimer()
        
        //webview
        webButton.layer.cornerRadius = 0.5 * webButton.bounds.size.width
        webButton.clipsToBounds = true
        
        webimage.layer.cornerRadius = 0.5 * webimage.bounds.size.width
        webimage.clipsToBounds = true
        
        
    }
    
    
    //  Main화면에서 네비게이션 바 없애줌
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: 백링크
    @IBAction func touchupToLink(_ sender: Any) {
        let url = URL(string: "https://www.megamgccoffee.co.kr")
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
        //self.view.bringSubView(toFront: RecommendTable)
    }
    
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == bannerDataArray.count-1 {
            // 맨 처음 페이지로 돌아감
            homeBanner.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        homeBanner.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 100 {
            
            return bannerDataArray.count
            
        } else if collectionView.tag == 101 {
            return homeRecommendM.count
            
        } else if collectionView.tag == 102 {
            return homeNewsImagedata.count
        }
        
        return 1
        
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 100 {
            
            let cell = homeBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.homeBannerimg?.image = bannerDataArray[indexPath.row]
            return cell
            
        } else if collectionView.tag == 101 {
            
            let cell = homeRecommend.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! HomeRecommendCollectionViewCell
            cell.homeRecommendMenu.image = UIImage(named: homeRecommendM[indexPath.row])
            cell.homeRecommendLabel.text = homeRecommendText[indexPath.row]
            cell.homeBackView.layer.cornerRadius = cell.frame.width / 2
            cell.tag = indexPath.row // 0, 1 , 2 , 3
            
            //cell.homeRecommendLabel.layer.cornerRadius = cell.frame.height / 2
            return cell
            
        } else if collectionView.tag == 102 {
            let cell =  homeNews.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! HomeNewsCollectionViewCell
            cell.homeNewsImage.image = UIImage(named: homeNewsImagedata[indexPath.row])
            cell.homeNewsLabel.text = homeNewsText[indexPath.row]
            cell.homeNewsImage.layer.cornerRadius = 15
            
            return cell
        }
        return UICollectionViewCell()
        
    }
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 100 {
            return CGSize(width: homeBanner.frame.size.width  , height:  homeBanner.frame.height)
            
        }  else if  collectionView.tag == 101 {
            
            return CGSize(width: 150, height: 190)
            
        }  else if  collectionView.tag == 102 {
            return CGSize(width: 250, height: 200)
        }
        
        return CGSize.zero
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 100 {
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreEventAndRankingEventTVC")
//            as? MoreEventAndRankingEventTVC
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//            //--
//
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MoreEventAndRankingEventTVC")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
        }
        if collectionView.tag == 101 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "HomePopupViewController") as! HomePopupViewController
            vc.viewcontroller = self
            //vc.imageReceived = UIImage(named: homePopupimage[indexPath.row])!
            vc.menuReceive = homePopupMenu[indexPath.row]
            vc.menuText = homePopupText[indexPath.row]
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
            
        }
        
        if collectionView.tag == 102 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeStampViewController")
            as? HomeStampViewController
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
        //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            
        }
        
    }
}

