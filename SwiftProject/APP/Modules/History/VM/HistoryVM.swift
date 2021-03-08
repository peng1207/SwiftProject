//
//  HistoryVM.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation

class HistoryVM : NSObject {
    @objc dynamic var dataArray : [DataModel]?
    
    override init() {
        super.init()
        setupData()
    }
    fileprivate func setupData(){
        self.dataArray = DataTool.getAll()
    }
    
    func getSelectData(indexPath : IndexPath)->DataModel?{
        guard let list = self.dataArray else {
            return nil
        }
        if indexPath.row < list.count {
            return list[indexPath.row]
        }
        return nil
    }
}
