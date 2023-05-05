//
//  homeSegment.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/12/12.
//

import UIKit

class HomeSegment: UISegmentedControl {
    
    private lazy var underlineView: UIView = {
      let width = self.bounds.size.width / CGFloat(self.numberOfSegments)
      let height = 30.0
      let xPosition = CGFloat(self.selectedSegmentIndex * Int(width))
      let yPosition = self.bounds.size.height - 1.0
      let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
      let view = UIView(frame: frame)
    //label.font = label.font.withSize(20)

      view.backgroundColor = .black
      self.addSubview(view)
      return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        removeBackgroundAndDivider()
    }
   
    func removeBackgroundAndDivider() {
      let image = UIImage()
      self.setBackgroundImage(image, for: .normal, barMetrics: .default)
      self.setBackgroundImage(image, for: .selected, barMetrics: .default)
      self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
      self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
 
    }

    
    override func layoutSubviews() {
      super.layoutSubviews()
      
      let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
      UIView.animate(
        withDuration: 0.1,
        animations: {
          self.underlineView.frame.origin.x = underlineFinalXPosition
      
        }
      )
    }
}



