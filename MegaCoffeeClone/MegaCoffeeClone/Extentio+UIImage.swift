//
//  Extentio+UIImage.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import Foundation
import UIKit

func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
    let scale = newWidth / image.size.width // 새 이미지 확대/축소 비율
    let newHeight = image.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage ?? UIImage()
}
