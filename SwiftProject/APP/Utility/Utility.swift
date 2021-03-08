//
//  Utility.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import UIKit
 
func getStatusBarHight()->CGFloat{
    var statusBarHeight : CGFloat = 0
       
        if let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager {
            statusBarHeight = statusBarManager.statusBarFrame.size.height
        }
      
 
       return statusBarHeight
}
