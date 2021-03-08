//
//  ExLabel.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import UIKit

extension UILabel{
    
    class func initUI(title : String,fontSize : CGFloat,textAlignment :NSTextAlignment = .center,textColor : UIColor = UIColor.black,numberOfLines : Int = 0)->UILabel{
        let label = UILabel()
        label.text = title
        label.textAlignment = textAlignment
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
    }
    
}
