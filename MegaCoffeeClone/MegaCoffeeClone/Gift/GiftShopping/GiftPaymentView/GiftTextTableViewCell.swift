//
//  GiftTextTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/30.
//

import UIKit

class GiftTextTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //맨처음의 textView 상태
        
        textView.layer.cornerRadius = 15
        if textView.text.isEmpty {
            textView.text = "메시지를 입력해주세요."
            textView.textColor = UIColor.systemGray2
        }
        textView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension GiftTextTableViewCell: UITextViewDelegate {
   
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray2 {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메시지를 입력해주세요."
            textView.textColor = UIColor.systemGray2
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
       
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        numberLabel.text = "\(changedText.count)/100"
        return changedText.count <= 99
    }
}
