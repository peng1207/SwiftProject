//
//  DataModel.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import RealmSwift

class DataModel : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var time : String = ""
    @objc dynamic var content : String = ""
//    @objc dynamic var id : String = ""
    
}
  
