

import Foundation
import UIKit

protocol MyCustomSegmentControlDelegate: AnyObject {
    // 아이템이 선택되었다.
    func segmentValueChanged(to index: Int)
}

class MyCustomSegmentControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var textColor: UIColor = .black
    
    var selectedColor : UIColor = #colorLiteral(red: 0.9803921569, green: 0.3137254902, blue: 0.5176470588, alpha: 1)
    
    public private(set) var selectedIndex : Int = 0
    
    weak var mySegmentDelegate : MyCustomSegmentControlDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 기본적인 뷰 설정
    }
    
    // 데이터를 뷰에 적용 할때
    convenience init(frame: CGRect,buttonTitles: [String]) {
        self.init(frame: frame)
        print("MyCustomSegmentControl - convenience init() called")
        self.buttonTitles = buttonTitles
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("MyCustomSegmentControl - draw() called")
        updateView()
    }
    
    fileprivate func updateView(){
        print("MyCustomSegmentControl - updateView() called")
        // 버튼 만들기
        createBtn()
        // 스택뷰 설정 하기
        configStackView()
    }
    
    fileprivate func createBtn(){
        print("MyCustomSegmentControl - createBtn() called")
        self.buttons = [UIButton]()
        // 기존 버튼들 다 지우기
        self.buttons.removeAll()
        // 하위 뷰들을 다 지운다.
        self.subviews.forEach({$0.removeFromSuperview()})
        for bunttonTitleItem in buttonTitles {
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            button.backgroundColor = .white
            button.layer.cornerRadius = 20
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.5
            button.setTitle(bunttonTitleItem, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(MyCustomSegmentControl.buttonAction(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        // 선택된 버튼 설정
        buttons[0].setTitleColor(.white, for: .normal)
        buttons[0].backgroundColor = selectedColor
        
    }
    
    fileprivate func configStackView(){
        print("MyCustomSegmentControl - configStackView() called")
        
        //
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
    }
    
    // 세그먼트 버튼이 선택되었을때
    @objc func buttonAction(_ sender: UIButton){
        
        for(buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                self.selectedIndex = buttonIndex
                mySegmentDelegate?.segmentValueChanged(to: self.selectedIndex)
                btn.backgroundColor = selectedColor
                btn.setTitleColor(.white, for: .normal)
            } else {
                btn.backgroundColor = .white
                btn.setTitleColor(textColor, for: .normal)
            }
        }
        print("MyCustomSegmentControl - buttonAction() called / selectedIndex : \(self.selectedIndex)")
    }
    
}
