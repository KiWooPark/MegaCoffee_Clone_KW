//
//  UITextField+.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/12/14.
//

import Foundation
import UIKit

extension UITextField {
    
    
    // MARK: Keyboard Toolbar
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        
        
        
        
        // flexSpace를 만들어준 이유는, 완료버튼을 우측에 두기 위함
        let up: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:
                                                                    "chevron.up"), style: .done, target: self, action: nil)
        let down: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:
                                                                    "chevron.down"), style: .done, target: self, action: nil)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       
        let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        
        
        
        let items = [up, down, flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    
    
    
    
    // MARK: [Action] Keyboard Toolbar
    @objc func upAction() {
        
    }
  
    @objc func downAction() {
        
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    
    
    
    
}


